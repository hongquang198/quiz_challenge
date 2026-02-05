import 'package:firebase_database/firebase_database.dart';

class RtdbRefs {
  RtdbRefs(this._db);

  final FirebaseDatabase _db;

  DatabaseReference quiz(String quizId) => _db.ref('quizzes/$quizId');
  DatabaseReference quizConfig(String quizId) => _db.ref('quizzes/$quizId/config');
  DatabaseReference quizGameState(String quizId) => _db.ref('quizzes/$quizId/gameState');
  DatabaseReference quizQuestions(String quizId) => _db.ref('quizzes/$quizId/questions');

  DatabaseReference participants(String quizId) => _db.ref('participants/$quizId');
  DatabaseReference participant(String quizId, String userId) =>
      _db.ref('participants/$quizId/$userId');

  DatabaseReference answersForQuestion(String quizId, int questionIndex) =>
      _db.ref('answers/$quizId/$questionIndex');
  DatabaseReference answer(String quizId, int questionIndex, String userId) =>
      _db.ref('answers/$quizId/$questionIndex/$userId');

  DatabaseReference pointsAwarded(String quizId, int questionIndex, String userId) =>
      _db.ref('pointsAwarded/$quizId/$questionIndex/$userId');

  DatabaseReference serverTimeOffset() => _db.ref('.info/serverTimeOffset');
}

