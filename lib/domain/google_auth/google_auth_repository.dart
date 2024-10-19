import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:share_way_frontend/data/services/google_auth/google_auth_service.dart';

class GoogleAuthRepository {
  final _service = GoogleAuthService();

  Future<User?> signInWithGoogle() async {
    try {
      final response = await _service.signInWithGoogle();
      return response;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _service.signOut();
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
    }
  }

  User? getCurrentUser() {
    try {
      final response = _service.getCurrentUser();
      return response;
    } catch (error, statckTrace) {
      if (kDebugMode) {
        print("$error + $statckTrace");
      }
      return null;
    }
  }
}
