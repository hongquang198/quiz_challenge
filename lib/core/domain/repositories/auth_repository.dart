abstract interface class AuthRepository {
  Future<String> signInAnonymously();
  String? currentUserId();
}

