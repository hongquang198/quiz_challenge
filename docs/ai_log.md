<!-- I use Cursor AI as a pair-programming assistant, verifying REQS.md for its feasibility and double-checking then finding potential pitfalls and update the implementation details here -->
## AI Collaboration Log

This repo was implemented using **Cursor AI & Antigravity** as pair-programming assistants.

### 2026-02-04 — Clean Architecture Scaffold + Domain Layer
- **Tool**: Cursor AI (chat + code edits)
- **Task**: scaffold `lib/` (feature-first clean architecture), add domain entities + repository contracts from `REQS.md`, set up get_it + injectable.
- **Prompts / interaction** (summary):
  - “Scaffold lib/ folder structure according to Clean Architecture (feature-first).”
  - “Generate domain entities + repository interfaces based on the Firebase schema in REQS.md.”
  - “Set up get_it + injectable and wire codegen.”
- **What AI produced**:
  - Feature/domain entity definitions with `freezed`
  - DI bootstrapping with `injectable`
- **Verification steps**:
  - Ran `flutter pub get`
  - Ran `flutter pub run build_runner build --delete-conflicting-outputs`
  - Ran `flutter analyze` until clean

### 2026-02-04 — Data Layer (Firebase RTDB + Anonymous Auth) + Rules
- **Tool**: Cursor AI (chat + code edits)
- **Task**: implement host-authoritative data layer (answers write-once, host-only scoring), DTOs/mappers with `freezed` + `json_serializable`, DI registrations, and RTDB security rules.
- **Prompts / interaction** (summary):
  - “Implement Firebase RTDB repositories with write-once answers and host-only score updates.”
  - “Add DTOs with freezed/json_serializable and map to domain.”
  - “Write RTDB security rules for anonymous auth + host-authoritative scoring.”
- **What AI produced**:
  - `FirebaseQuizRepository`, `FirebaseTimeSyncRepository`, `FirebaseAuthRepository`
  - `OpenTriviaApi` + `OpenTriviaRepository`
  - RTDB rules file `firebase/database.rules.json`
- **Verification steps**:
  - Ran `flutter pub get`
  - Ran `flutter pub run build_runner build --delete-conflicting-outputs`
  - Ran `flutter analyze` until clean
  - Manually reviewed rules for:
    - players cannot write score
    - answers are write-once
    - host-only reads for answers/pointsAwarded

### 2026-02-04 — BLoCs + Unit Tests
- **Tool**: Cursor AI (chat + code edits)
- **Task**: Implement feature BLoCs (create quiz, lobby, host game, player game) and add unit tests around scoring and answer locking.
- **Prompts / interaction** (summary):
  - “Implement BLoCs for create-quiz, lobby, host game, and player game, wired to the existing repositories.”
  - “Write tests that cover host scoring logic and player answer submission (single-submit, uses repository correctly).”
- **What AI produced**:
  - `CreateQuizBloc`, `LobbyBloc`, `HostGameBloc`, `PlayerGameBloc`
  - Tests under `test/features/quiz/presentation/*.dart` using `bloc_test` + `mocktail`
- **Verification steps**:
  - Added `bloc_test` and `mocktail` as dev dependencies
  - Ran `flutter pub get`
  - Ran `flutter pub run build_runner build --delete-conflicting-outputs`
  - Ran `flutter analyze` (clean)
  - Ran `flutter test` to ensure all bloc tests pass

### How to extend this log during development
For each meaningful AI-assisted change, add:
- Tool + task
- Prompt(s) used
- What you verified (tests, manual multi-device run, analyze, rule simulation)


### 2026-02-04 — Host Re-join, UI Polish & Critical Stability Fixes
- **Tool**: Antigravity (chat + investigation)
- **Task**: Implement Host re-joining quiz, fix "Start Game" failures, debug silent player streams, and implement immediate feedback.
- **Key Issues Found & Fixed**:
  - **Host Re-join**: `_LobbyAndGameView` was dispatching events in `build()`. Fixed by converting to StatefulWidget (`initState`).
  - **Type Errors (Web)**: Robust double-parsing for questions, server time offset fallbacks, and node-level rewrite for `startGame` fix data mismatch.
  - **[CRITICAL] Bloc Lifecycle & Navigation**: 
      - **Disposal Bug**: `PlayerGameBloc: CLOSE called` appeared immediately after join. Caused by `Navigator.pushReplacement` disposing the `PlayerJoinPage` (the Bloc's provider). Fixed by using `push` to keep the provider alive in the stack.
      - **Bad state (close)**: Crash when adding events to a closed bloc after navigation. Fixed by adding `isClosed` checks throughout `_onJoinRequested`.
  - **[CRITICAL] Infinite Navigation Loop**: Screen refreshed/flashed every second. Caused by `BlocListener` pushing new pages on every state update (timer ticks). Fixed by adding `listenWhen` to only push on initial transition to loaded state.
  - **Security Rules (Answers)**: `Permission denied` during answer submission. Root cause was string vs integer comparison in rules (`$questionIndex` vs `val()`). Fixed by forcing string comparison (`val() + ''`). Also added read access for transactions.
  - **UI/Feedback**: Added immediate correct/incorrect coloring for buttons. Fixed coloring logic for "disabled" buttons by setting `disabledBackgroundColor` in `ElevatedButton.styleFrom`.
- **Verification steps**:
  - Verified Host can re-join and start game (no crashes).
  - Verified Player remains connected to real-time streams across navigation.
  - Verified colors (Green/Red) display correctly after answering.
  - Verified navigation is stable (no flashing).
  - Verified security rules allow answer submission on physical devices/web.

### 2026-02-05 — High-Impact Animations and UI Refinement
- **Tool**: Antigravity (chat + code edits)
- **Task**: Implement "Slide-Over" finish animation, "Celebratory Emoji Pop", and personalized leaderboard highlighting.
- **Key Features & Refactors**:
  - **"Slide-Over" Finish**: Replaced `AnimatedCrossFade` with `Stack` + `AnimatedPositioned` in `HostFlowPage` and `PlayerGamePage`. On quiz finish, the question pane slides out left while the leaderboard slides in from the right and expands to full screen.
  - **`CelebratoryEmoji` Widget**: Created a reusable `StatefulWidget` using `TweenSequence` to animate a large "🎉" (scaling 0.2x to 5.0x and fading) over the leaderboard when the game ends.
  - **Shared Widget Refactor**: Moved `CelebratoryEmoji` from private implementations into `lib/features/quiz/presentation/view/widgets/` for DRY compliance across Host and Player flows.
  - **Leaderboard Highlighting**: 
      - Added `selfId` to `PlayerGameLoaded` state.
      - Updated `PlayerGameBloc` to inject current user's ID via `AuthRepository`.
      - Enhanced `LeaderboardPanel` tiles to show a prominent border (`colorScheme.primary`) and full opacity for the current user's entry.
  - **Unit Tests**: Updated `player_game_bloc_test.dart` to match updated state constructor (adding `selfId`).
- **Verification steps**:
  - Verified animation timing in `HostFlowPage` and `PlayerGamePage`.
  - Verified `CelebratoryEmoji` correctly disposes controller to prevent memory leaks.
  - Verified Host and Player both see their own row highlighted in the leaderboard.
  - Verified `maybeWhen` callback signatures are consistent across all view files.
  - Ran `test` on `PlayerGameBloc` to ensure updated state structure passes.