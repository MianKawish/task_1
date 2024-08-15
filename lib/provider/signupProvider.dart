import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/screens/homeScreen.dart';

class SignupProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("users");
  void signupUser(String firstName, String lastName, String email,
      String password, BuildContext ctx) async {
    _isLoading = true;
    try {
      final userCreds = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (_auth.currentUser != null) {
        await userRef.doc(userCreds.user?.uid).set({
          "firstName": firstName,
          "lastName": lastName,
          "email": userCreds.user!.email,
        });
      }

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
