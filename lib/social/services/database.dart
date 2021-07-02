import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  Future getImageUser() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where('userId', isEqualTo: userId)
        .get();
    return snapshot.docs[0]['imageUrl'];
  }

  Future getNameUser() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where('userId', isEqualTo: userId)
        .get();
    return snapshot.docs[0]['username'];
  }

  Future<void> addDocument(String path, var data) async {
    await FirebaseFirestore.instance
        .collection(path)
        .add(data)
        .then((val) => print("document added : $path : $data"))
        .catchError((error) => print("Failed to add document: $error"));
  }

  Future<void> searchByName(String searchName) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where('username', isEqualTo: searchName)
        .get()
        .then((value) => print("Search by name"))
        .catchError((error) => print("Failed to search by name: $error"));
  }
}
