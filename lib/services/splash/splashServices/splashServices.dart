import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/view/homeView/homeScreen.dart';
import 'package:task_1/view/loginView/loginScreen.dart';

class SplashServices {
  void loginUser(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      _checkLoginState(context);
    });
  }

  Future<void> _checkLoginState(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    }
  }
}
