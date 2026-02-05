## Real-Time Quiz — System Design (Firebase RTDB + Flutter)

### Architecture Diagram

```mermaid
flowchart LR
  subgraph Clients
    H[Host (Flutter)]
    P[Players (Flutter)]
  end

  RTDB[(Firebase Realtime Database)]
  AUTH[(Firebase Anonymous Auth)]
  OFFSET[/.info/serverTimeOffset]
  TRIVIA[Open Trivia DB]

  H <--> AUTH
  P <--> AUTH

  H <--> RTDB
  P <--> RTDB

  H --> OFFSET
  P --> OFFSET

  H --> TRIVIA
```

### Components
- **Flutter Host**: creates a quiz, fetches questions, starts the game, and performs **host-authoritative scoring** (writes score updates).
- **Flutter Player**: joins a quiz by ID, submits a write-once answer per question, and listens to participants stream for leaderboard.
- **Firebase Anonymous Auth**: provides stable `auth.uid` for rules + per-user data ownership.
- **Firebase RTDB**: real-time sync for quiz state + participants + scores.
- **`/.info/serverTimeOffset`**: used to compute server-aligned “now” for consistent countdowns.
- **Open Trivia DB**: external question source (multiple choice).

### Data Model (key paths)
- **Quiz**: `/quizzes/{quizId}`
  - `config`: `{ hostId, status, questionDuration }`
  - `gameState`: `{ currentQuestionIndex, questionStartedAt }`
  - `questions/{index}`: `{ text, options[], correctIndex }`
- **Participants**: `/participants/{quizId}/{userId}`: `{ name, score }`
- **Answers (write-once)**: `/answers/{quizId}/{questionIndex}/{userId}`: `{ questionIndex, selectedOptionIndex, answeredAt }`
- **Idempotency guard**: `/pointsAwarded/{quizId}/{questionIndex}/{userId}`: `points`

### Data Flow (join → answer → leaderboard)
- **Join**:
  - Player signs in anonymously → gets `userId`.
  - Player writes `/participants/{quizId}/{userId}/name` (and initial score=0 on join).
  - Clients stream `/participants/{quizId}` for live lobby + leaderboard.
- **Start**:
  - Host sets `config.status = inProgress`, sets `gameState.currentQuestionIndex = 0`, sets `gameState.questionStartedAt = serverNow`.
- **Answer submit (player)**:
  - Player writes their answer to `/answers/...` using a transaction so it’s **write-once**.
- **Scoring (host-authoritative)**:
  - Host listens to `/answers/{quizId}/{questionIndex}` and for each new child:
    - Computes correctness vs `questions[questionIndex].correctIndex`
    - Computes `secondsRemaining` using server-aligned `now` and `questionStartedAt`
    - Uses an idempotency write to `/pointsAwarded/...` to prevent double-awards on restarts
    - Increments `/participants/{quizId}/{userId}/score`
- **Leaderboard**:
  - All clients stream `/participants/{quizId}` and sort locally by `score` (ties can be broken by name/userId in presentation).

### Technology Choices (why)
- **RTDB**: fastest path to real-time multiplayer without custom backend.
- **Anonymous Auth**: stable identity for ownership/rules with minimal UX friction.
- **Host-authoritative scoring**: consistent scoring without Cloud Functions (good for mobile-only candidates), with explicit trade-offs documented.

### Realtime Database Security Rules (summary)

Rules are implemented in `firebase/database.rules.json` and enforce:

- **Authentication required**: all `.read` / `.write` operations require `auth != null` (anonymous auth is fine).
- **Host ownership**:
  - Only the `hostId` stored at `quizzes/{quizId}/config/hostId` may:
    - mutate `config`, `gameState`, and `questions`
    - update `participants/{quizId}/{userId}/score`
    - write to `pointsAwarded/{quizId}/{questionIndex}/{userId}` (idempotency guard).
- **Player permissions**:
  - Players can only:
    - write their own `participants/{quizId}/{uid}/name`
    - submit a single answer per question under `answers/{quizId}/{questionIndex}/{uid}`, and only while:
      - `config/status == 'inProgress'`
      - `gameState/currentQuestionIndex == questionIndex`
  - Answers are **write-once** per user/question: rules require `!data.exists()` before allowing a write.
- **Host-only answer visibility**:
  - `answers/{quizId}/{questionIndex}` is `.read`-able only by the host so scoring remains host-authoritative and players cannot see everyone else’s answers.
