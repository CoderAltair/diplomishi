
import 'package:avtdevs/service/pref.dart';
import 'package:avtdevs/service/prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService._();
  static AuthService instance = AuthService._();
  static final _auth = FirebaseAuth.instance;
  AppPrefs prefs = AppPrefs.instance;
  static Future<User?> signInUser(
      BuildContext context, String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      final User? user = _auth.currentUser;
      debugPrint(user.toString());
      return user;
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<User?> signUpUser(
      BuildContext context, String email, String password, String name) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: "$email@gmail.com", password: "123456");

      User? user = authResult.user;
      debugPrint(user.toString());
      if (user != null) {
        await prefs.setEmployeeService(user.uid);
        await Prefs.saveUserId(user.uid);
      }
      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }

  static Future<Firebase?> signOut(
    BuildContext context,
  ) async {
    _auth.signOut();

    return null;
  }
}
