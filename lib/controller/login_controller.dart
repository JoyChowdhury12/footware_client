import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footware_client/auth/fireBase_auth_service.dart';
import 'package:footware_client/model/user.dart';
import 'package:footware_client/pages/home_page.dart';
import 'package:footware_client/pages/login_page.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final FireBaseAuthService _auth = FireBaseAuthService();
  bool isSigning = false;
  // late CollectionReference userCollection;

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  void dispose() {
    registerEmailController.dispose();
    registerPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  // @override
  // void onInit() {
  //   userCollection = firebaseFirestore.collection('users');
  //   super.onInit();
  // }

  // addProduct() {
  //   try {
  //     if (registerEmailController.text.isEmpty ||
  //         registerPasswordController.text.isEmpty) {
  //       return Get.snackbar("Error", "Please fill the field",
  //           colorText: Colors.red);
  //     }
  //     DocumentReference doc = userCollection.doc();
  //     User user = User(
  //       email: registerEmailController.text,
  //       password: int.parse(registerPasswordController.text),
  //     );
  //     final userJson = user.toJson();
  //     doc.set(userJson);
  //     Get.snackbar("Success!", "Registration successful",
  //         colorText: Colors.green);
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString(), colorText: Colors.red);
  //   }
  // }
  void signUp() async {
    isSigning = true;
    update();
    String email = registerEmailController.text;
    String password = registerPasswordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    isSigning = false;
    update();

    if (user != null) {
      Get.snackbar("Registration successful!", "User is successfully created");
      Get.to(LoginPage());
    } else {
      Get.snackbar("Something went wrong", "Please try again");
    }
  }

  void signIn() async {
    isSigning = true;
    update();
    String email = loginEmailController.text;
    String password = loginPasswordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    isSigning = false;
    update();

    if (user != null) {
      print("User is successfully created");
      Get.to(HomePage());
    } else {
      print("Some error happend!");
    }
  }
}
