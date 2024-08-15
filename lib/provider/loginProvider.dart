import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/screens/homeScreen.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void loginUser(String email, String password, BuildContext ctx) async {
    _isLoading = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _isLoading = false;
      Navigator.pushReplacement(
          ctx,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } catch (e) {
      print(e.toString());
      _isLoading = false;
    }

    notifyListeners();
  }
}
