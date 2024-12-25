import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FireBaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Get.snackbar(
            "Registration failed", "The email address is already in use.",
            colorText: Colors.red);
      } else {
        Get.snackbar("Something went wrong", "${e.code}",
            colorText: Colors.red);
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        Get.snackbar("Login failed", "Invalid email or password",
            colorText: Colors.red);
      } else {
        Get.snackbar("Something went wrong", "${e.code}",
            colorText: Colors.red);
      }
    }
    return null;
  }
}
