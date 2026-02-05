# Real-Time Quiz (Multiplayer Challenge) 🏆🎮

A high-performance, real-time multiplayer quiz application built with Flutter and Firebase Realtime Database. This project demonstrates a robust, architecture-first approach to building distributed, synchronized user experiences.

## 🏗️ Architecture

The project follows a strict **Clean Architecture** pattern, ensuring separation of concerns, high testability, and massive scalability.

### Layers:
1.  **Presentation Layer (UI/Logic)**: Built with `flutter_bloc` for predictable state management. It handles user interactions, real-time timer sync, and celebratory animations.
2.  **Domain Layer (Business Logic)**: Contains pure business rules (Entities & Use Cases). It defines the interfaces (Repositories) that the infrastructure must implement, keeping the core logic framework-agnostic.
3.  **Data Layer (Infrastructure)**: Implements the Domain interfaces. It manages communication with **Firebase Realtime Database (RTDB)**, handles data mapping (DTOs), and ensures atomic operations using Firebase Transactions.

---

## ✨ Key Features

-   **Real-time Synchronization**: Sub-second latency for question transitions and leaderboard updates across all connected devices.
-   **Host-Authoritative Logic**: The Host device drives the game state, calculating scores and advancing questions to prevent client-side tampering.
-   **Distributed Timer**: A server-time synced countdown timer that stays accurate even if local clocks are out of sync.
-   **Minimum Player Threshold**: Automated lobby guard that ensures at least **2 players** have joined before allowing the quiz to start, guaranteeing a competitive environment.
-   **Smart Re-join**: Advanced detection logic allows Hosts and Players to seamlessly re-enter active games if disconnected.
-   **Immediate Feedback**: Interactive UI providing instant visual cues (Green/Red) for correct and incorrect answers.
-   **Celebratory Finish**: Dynamic "Slide and Expand" animations with particle-style celebratory effects when the quiz results are revealed. 🥇🎉

---

## 🛠️ Setup Instructions

### Prerequisites
-   Flutter SDK (^3.7.0)
-   Dart SDK
-   Firebase Account (with Realtime Database enabled)

### Installation
1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-repo/real-time-quiz.git
    cd real-time-quiz
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Firebase Configuration**:
    -   Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the respective platform directories.
    -   Ensure Firebase RTDB rules allow authenticated (anonymous) read/write.
4.  **Run Build Runner**:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  **Run App**:
    ```bash
    flutter run
    ```

---

## 🧪 Running Tests

The project features a test suite covering over **35+ specialized scenarios**.

-   **Run all tests**:
    ```bash
    flutter test
    ```
-   **Check coverage**:
    ```bash
    flutter test --coverage
    # Open coverage/lcov.info in a viewer
    ```

### 📊 Coverage Results:
-   **Logic (Blocs)**: `LobbyBloc` (100%), `PlayerGameBloc` (~76%), `HostGameBloc` (~62%).
-   **Infrastructure**: `FirebaseQuizRepository` (**83.1%**), `QuizMappers` (**96%**).

---

## 📂 Project Structure

```text
lib/
├── app/               # App configuration & Dependency Injection
├── core/              # Shared infrastructure (Auth, failures, utils)
└── features/
    └── quiz/
        ├── data/      # RTDB Repositories, DTOs, and Mappers
        ├── domain/    # Entities and Repository Interfaces
        └── presentation/
            ├── bloc/  # BLoC state management
            ├── view/  # Pages and complex UI flows
            └── widget/# Reusable UI components
```

---

## 🚀 Highlights & Technical Rigor

-   **Code Quality**: Full adherence to `flutter_lints`, zero platform-specific hacks, and 100% decoupling of Repository implementations from the UI.
-   **UI/UX**: Custom `CelebratoryEmoji` system, Slide-transition results, and high-contrast color palettes for accessibility.
-   **Technical Implementation**: 
    -   **Idempotent Scoring**: Uses a "pointsAwarded" guard node in RTDB to ensure atomic increments exactly once per user/question.
    -   **Atomic Joins**: Transactions ensure users cannot join twice or with invalid names.
    -   **Dynamic Shuffling**: Randomizes correct answer positions via `OpenTriviaApi` and tracks them precisely through atomic indices to prevent "answer patterns."
    -   **Clean States**: Sealed classes for BLoC states ensure "impossible" UI states are never rendered.

---

## 🚧 Known Limitations & Future Enhancements

-   **Current Limitations**:
    -   Host must remain online to "authoritatively" score (could be moved to Cloud Functions for production).
    -   Anonymous Auth only: Users lose data if they clear storage.
-   **Future Enhancements**:
    -   **Social Integration**: Real identity auth (Google/Apple).
    -   **Quiz Database**: Integration with Open Trivia DB or custom creation tool.
    -   **Sound Effects**: Native sound pool for haptic and audio feedback.

---

## 📦 Key Dependencies

-   `flutter_bloc`: Reactive state management.
-   `firebase_database`: Low-latency real-time synchronization.
-   `injectable` & `get_it`: Dependency Injection for decoupled architecture.
-   `freezed` & `json_serializable`: Type-safe data modeling and serialization.
-   `mocktail`: Advanced unit test mocking.

---