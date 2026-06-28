// Lab assignment 8 - Firebase Database
// Group: Colin Schulte, Dylan Schulte
// auth_service.dart

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Private helper to toggle loading
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Sign up with email and password
  Future<UserCredential?> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign in
  Future<void> signIn(String email, String password) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } finally {
      _setLoading(false); // Stop loading even if it fails
    }
  }

  Future<void> signInWithGoogle() async {
    _setLoading(true);
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
    } finally {
      _setLoading(false); // Stop loading even if it fails
    }
  }

  // Sign out
  Future<void> signOut() async => await _auth.signOut();
}
