import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/di/injection.dart';
import 'features/quiz/presentation/view/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyAqfoBNfRWtKHTYPugjBHIq7csvg2dRmeo",
    appId: "1:1063047187255:android:0ef6f78045b27cab51a8b2",
    messagingSenderId: "1063047187255",
    projectId: "real-time-quiz-a1908",
    databaseURL: "https://real-time-quiz-a1908-default-rtdb.asia-southeast1.firebasedatabase.app",
    storageBucket: "real-time-quiz-a1908.firebasestorage.app",
  ),
  );
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark);

    return MaterialApp(
        title: 'Real-Time Quiz',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          scaffoldBackgroundColor: colorScheme.surface,
          appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.surface,
            foregroundColor: colorScheme.onSurface,
            elevation: 0,
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            headlineMedium: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          cardTheme: CardTheme(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        home: const HomePage(),
    );
  }
}
