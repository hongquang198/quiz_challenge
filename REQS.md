<!-- I brainstormed high-level features/ideas by conversing with Gemini 3-->
<!-- We need a high-level documentation/specification first before giving to AI agents for implementation -->

REQS.md: Real-Time Vocabulary Quiz App
1. Project Overview
A real-time, competitive vocabulary quiz application built with Flutter. The app uses Firebase Realtime Database for synchronized gameplay and live leaderboards.

2. Tech Stack & Architecture
- Framework: Flutter
- Architecture: Clean Architecture (Data, Domain, Presentation layers)
- State Management: BLoC (using flutter_bloc)
- Dependency Injection: get_it with injectable
- Backend: Firebase Realtime Database (via WebSocket-based streams)

3. Core Features & Requirements
A. Quiz Session Management
- Unique Quiz Creation (Host):
    - Generate a unique 6-character alphanumeric Quiz ID.
    - Validate uniqueness via $O(1)$ probe in Firebase before finalizing.
    - Fetch 10 multiple-choice questions from Open Trivia DB and store them under /questions/{quizId}.
- Participation (Player):
    - Input Quiz ID to join.
    - Validation: Check quizzes/{quizId}/status. Users can only join if status is waiting.
    - Once ID is validated, prompt for a "Display Name."
- Waiting Room (Lobby):
    - Real-time list of joined participants (Stream from /participants/{quizId}).
    - Host View: "Start Game" button.
    - Player View: "Waiting for Host" message.

B. Synchronized Gameplay Engine
- Global Game State: 
    - Host sets config/status to inProgress and gameState/currentQuestionIndex to 0.
    - State Transitions: Clients transition UI based on the status field. currentQuestionIndex starts at 0 only after game transition.
    - When host updates index, all players transition to the new question simultaneously
3. Gameplay Rules
-   **Multiplayer Threshold**: A minimum of **2 players** is required to start any quiz. The Host's "Start Game" button remains disabled until this condition is met.
-   Timing: Users have 15 seconds per question.
    - Sync using /.info/serverTimeOffset to ensure all devices share a synchronized clock.
- Answer Locking:
    - Users select one of four options.
    - UI locks immediately after selection or when timer reaches zero.
- Scoring Logic:
    - Validation: Answers are validated in the QuizRepository. The client compares selectedOptionIndex with the Question.answerIndex.
    - Calculation: > - Correct Answer: 100 points (Base) + (SecondsRemaining * 10) (Speed Bonus).

Incorrect/Timeout: 0 points.

Atomic Update: Use Firebase ServerValue.increment(points) to ensure the score update is thread-safe.

C. Live Leaderboard (Star Feature)
- Mini-Leaderboard: Display top 3 rankings at the bottom of the question screen.
- Real-Time Updates: Use Firebase streams to detect score changes and re-sort rankings instantly.
- Animations: Use ImplicitlyAnimatedList to physically animate players sliding up/down the list when ranks change.
- Self-Highlighting: Distinct UI styling for the local user's entry in the list.

4. Data Schema (Firebase Realtime DB)
JSON
{
  "quizzes": {
    "$\quizId": {
      "config": {
        "hostId": "string",
        "status": "waiting | inProgress | finished",
        "questionDuration": 15
      },
      "gameState": {
        "currentQuestionIndex": -1,
        "questionStartedAt": 0
      },
      "questions": [
        {
          "text": "Encoded HTML String from API",
          "options": ["Paris", "Lyon", "Marseille", "Berlin"],
          "correctIndex": 0
        }
      ]
    }
  },
  "participants": {
    "$quizId": {
      "$userId": { "name": "string", "score": 0 }
    }
  }
}
5. Non-Functional Requirements
- Resilience: If the app restarts, the BLoC must "re-sync" by reading the current currentQuestionIndex and status to resume gameplay.
- Code Quality: Zero business logic in UI; strictly follow Clean Architecture boundaries
- Scalability: Flat data structures to avoid deep-nesting performance issues.