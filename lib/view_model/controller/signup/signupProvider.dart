import 'package:flutter/material.dart';
import 'package:task_1/services/auth/authentication_services.dart';
import 'package:task_1/services/firestore/firestore_services.dart';
import 'package:task_1/utils/utils.dart';
import 'package:task_1/view/homeView/homeScreen.dart';

class SignupProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signupUser(String firstName, String lastName, String email,
      String password, BuildContext ctx) async {
    print("Entered into Signup");
    _isLoading = true;
    notifyListeners();
    print("IsLoadin should be true: $_isLoading");
    try {
      final userCreds = await AuthenticationServices.auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (AuthenticationServices.auth.currentUser != null) {
        await FirestoreServices.userRef.doc(userCreds.user?.uid).set({
          "firstName": firstName,
          "lastName": lastName,
          "email": userCreds.user!.email,
        });
      }

      _isLoading = false;
      print("IsLoadin should be false: $_isLoading");

      Navigator.pushReplacement(
          ctx,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } catch (e) {
      Utils.flutterToast(e.toString());
      _isLoading = false;
      print("IsLoadin should be false: $_isLoading");
    }

    notifyListeners();
  }
}
