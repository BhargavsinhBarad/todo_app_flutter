import 'package:cloud_firestore/cloud_firestore.dart';

class Firestorehelper {
  Firestorehelper._();

  static Firestorehelper firestorehelper = Firestorehelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addtask({required Map<String, dynamic> data}) {
    firestore.collection("task").doc("${data['id']}").set(data);
  }
}
