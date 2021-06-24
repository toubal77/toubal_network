import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Future<void> addDocument(String path, var data) async {
    await FirebaseFirestore.instance
        .collection(path)
        .add(data)
        .then((val) => print("document added : $path : $data"))
        .catchError((error) => print("Failed to add document: $error"));
  }

  Future sendMessage(String chatRoomId, var data) async {
    await FirebaseFirestore.instance
        .collection("ChatRoom")
        .add(data)
        .then((value) => print("send message"))
        .catchError((error) => print("Failed to send message: $error"));
  }

  Future addUserImage(String path, String nameImage, File imageFile) async {
    final ref =
        FirebaseStorage.instance.ref().child('user_image').child(nameImage);
    await ref.putFile(imageFile);
    final url = await ref.getDownloadURL();
    return url;
  }

  Future getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where('email', isEqualTo: email)
        .get()
        .then((value) => print("Get User Info"))
        .catchError((error) => print("Failed to get user info: $error"));
  }

  Future searchByName(String searchName) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where('username', isEqualTo: searchName)
        .get()
        .then((value) => print("Search by name"))
        .catchError((error) => print("Failed to search by name: $error"));
  }
}
