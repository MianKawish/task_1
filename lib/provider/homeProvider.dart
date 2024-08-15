import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_1/screens/loginScreen.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final userRef = FirebaseFirestore.instance.collection("users");
  final _auth = FirebaseAuth.instance;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void updateUserData(String firstName, String lastName) async {
    if (_auth.currentUser != null) {
      await userRef
          .doc(_auth.currentUser!.uid)
          .update({'firstName': firstName, "lastName": lastName});
    }
  }

  void logoutUser(BuildContext ctx) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  void textFieldValueIntializer() async {
    try {
      final DocumentSnapshot userData =
          await userRef.doc(_auth.currentUser!.uid).get();
      firstNameController.text = userData['firstName'];
      lastNameController.text = userData['lastName'];
      emailController.text = userData['email'];
    } catch (e) {
      print(e.toString());
    }
  }
}
