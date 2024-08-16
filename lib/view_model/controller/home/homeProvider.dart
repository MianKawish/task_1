import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_1/services/auth/authentication_services.dart';
import 'package:task_1/services/firestore/firestore_services.dart';
import 'package:task_1/utils/utils.dart';
import 'package:task_1/view/loginView/loginScreen.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void updateUserData(String firstName, String lastName) async {
    if (AuthenticationServices.auth.currentUser != null) {
      await FirestoreServices.userRef
          .doc(AuthenticationServices.auth.currentUser!.uid)
          .update({'firstName': firstName, "lastName": lastName});
    }
  }

  void logoutUser(BuildContext ctx) async {
    await AuthenticationServices.auth.signOut();
    Navigator.pushReplacement(
        ctx,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  void textFieldValueIntializer() async {
    try {
      final DocumentSnapshot userData = await FirestoreServices.userRef
          .doc(AuthenticationServices.auth.currentUser!.uid)
          .get();
      firstNameController.text = userData['firstName'];
      lastNameController.text = userData['lastName'];
      emailController.text = userData['email'];
    } catch (e) {
      Utils.flutterToast(e.toString());
    }
  }
}
