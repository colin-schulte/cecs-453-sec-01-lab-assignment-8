import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;
  bool _isLoading = false;

  AuthRepository() {
    // Listen to changes and notify the UI
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  // Example sign-in method
  Future<void> signIn(String email, String password) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } finally {
      _setLoading(false); // Stop loading even if it fails
    }
  }

  // Sign out method
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  bool get isLoading => _isLoading;

  // Private helper to toggle loading
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
