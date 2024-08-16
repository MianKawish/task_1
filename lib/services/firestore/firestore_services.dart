import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static final userRef = FirebaseFirestore.instance.collection("users");
}
