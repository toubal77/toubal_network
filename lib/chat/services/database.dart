import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toubal_network/chat/services/auth.dart';

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

  Future<void> createImageUser(
      String email, String name, File imageFile) async {
    try {
      String nameImage = email + '.jpg';
      final ref =
          FirebaseStorage.instance.ref().child('user_image').child(nameImage);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      String userId = AuthService().getIdUser();
      var userData = {
        "username": name,
        "email": email,
        "userId": userId,
        'imageUrl': url.toString()
      };
      DatabaseMethods().addDocument("users", userData);
      print('image user created with seccus!');
    } catch (err) {
      print("error in create image user:" + err.toString());
    }
  }

  Future<void> addDocument(String path, var data) async {
    await FirebaseFirestore.instance
        .collection(path)
        .add(data)
        .then((val) => print("document added : $path : $data"))
        .catchError((error) => print("Failed to add document: $error"));
  }

  Future<void> sendMessage(String chatRoomId, var data) async {
    await FirebaseFirestore.instance
        .collection("ChatRoom")
        .add(data)
        .then((value) => print("send message with seccus"))
        .catchError((error) => print("Failed to send message: $error"));
  }

  Future<void> sendMessageImage(String idRoom, File pickedImage) async {
    try {
      String nameImage = Timestamp.now().toString() + '.jpg';
      final ref =
          FirebaseStorage.instance.ref().child('Msg_image').child(nameImage);
      await ref.putFile(pickedImage);
      final url = await ref.getDownloadURL();
      String userId = AuthService().getIdUser();
      var _dataMessage = {
        'chatRoomId': idRoom,
        'idUser': userId,
        'createdAt': Timestamp.now(),
        'messageContent': url,
        'imageMsg': true,
        'read': false,
      };
      await DatabaseMethods().sendMessage(idRoom, _dataMessage);
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> deleteMessage(String idDoc) async {
    try {
      await FirebaseFirestore.instance
          .collection('ChatRoom')
          .doc(idDoc)
          .delete();
      print('message deleted with seccus!');
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> addUserImage(
      String path, String nameImage, File imageFile) async {
    try {
      final ref =
          FirebaseStorage.instance.ref().child('user_image').child(nameImage);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      print("add user image :" + url.toString());
    } catch (err) {
      print('error in add user image ' + err.toString());
    }
  }

  Future<void> getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where('email', isEqualTo: email)
        .get()
        .then((value) => print("Get User Info"))
        .catchError((error) => print("Failed to get user info: $error"));
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
