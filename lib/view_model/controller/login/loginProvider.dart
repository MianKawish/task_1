import 'package:flutter/material.dart';
import 'package:task_1/services/auth/authentication_services.dart';
import 'package:task_1/utils/utils.dart';
import 'package:task_1/view/homeView/homeScreen.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser(String email, String password, BuildContext ctx) async {
    _isLoading = true;
    notifyListeners();
    try {
      await AuthenticationServices.auth
          .signInWithEmailAndPassword(email: email, password: password);
      _isLoading = false;
      emailController.clear();
      passwordController.clear();
      Navigator.pushReplacement(
          ctx,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } catch (e) {
      Utils.flutterToast(e.toString());
      _isLoading = false;
    }

    notifyListeners();
  }
}
