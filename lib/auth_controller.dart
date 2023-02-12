import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management/admin/admin_login.dart';
import 'package:waste_management/admin/admin_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

class AuthController extends GetxController {
  //Authcontroller.instance..
  static AuthController instance = Get.find();
  bool isAdmin=false;
  //email, password, name...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user will be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
  }

  _intialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => isAdmin?const AdminLoginPage():LoginPage());
    } else {
      Get.offAll(() =>isAdmin? AHomePage():HomePage());
    }
  }

  void register(String email, password, name) {
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(auth.currentUser?.uid)
            .set({"email": email, "name": name});
            isAdmin=false;
      });
    } catch (e) {
      Get.snackbar("about User", "user message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }


  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        isAdmin=false;
      });
    } catch (e) {
      Get.snackbar("about User", "user message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

 void aregister(String email, password, name) {
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance
            .collection('Admins')
            .doc(auth.currentUser?.uid)
            .set({"email": email, "name": name});
            isAdmin=true;
      });
      
    } catch (e) {
      Get.snackbar("about User", "user message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }
    void alogin(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        isAdmin=true;
      });
    } catch (e) {
      Get.snackbar("about User", "user message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}