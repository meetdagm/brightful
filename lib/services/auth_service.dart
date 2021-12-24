

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final StreamController<bool> _authController = StreamController<bool>.broadcast();

  bool get isLoggedIn {
    return _firebaseAuth.currentUser != null;
  }

  String? get currentUserID {
    return _firebaseAuth.currentUser?.uid ;
  }

  Stream<bool> listenToAuthStateChanges() {
    _firebaseAuth.authStateChanges().listen((user) {
      _authController.add(user != null);
    });

    return _authController.stream;
  }

  Future logoutUser() async {
    try {
      return await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'An error occurred on the server';
    }
  }

  Future createUser() async {
    return await _firebaseAuth.signInAnonymously();
  }

  


  
}
