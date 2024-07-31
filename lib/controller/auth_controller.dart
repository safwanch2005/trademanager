import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademanager/models/user_model.dart';
import 'package:trademanager/view/pages/sign_up_page.dart';
import 'package:trademanager/view/pages/splash_screen.dart';
import 'package:trademanager/view/widgets/nav_bar/nav_bar.dart';
import 'package:trademanager/view/widgets/snackbars/error.dart';

class AuthController extends GetxController {
  var isSignUpPage = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  var loading = false.obs;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUp({
    required String userEmail,
    required String password,
  }) async {
    loading.value = true;

    if (userEmail.isEmpty) {
      errorSnackBar("Error", "Please enter your email");
      loading.value = false;
      return null;
    }
    if (password.isEmpty) {
      errorSnackBar("Error", "Please enter a password");
      loading.value = false;
      return null;
    }

    try {
      // print(email);
      // print(password);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: userEmail, password: password);
// Send email verification
      await userCredential.user!.sendEmailVerification();
      // Update the username
      User? user = userCredential.user;

      if (user != null) {
        //await user.updateDisplayName(userName);
        await user.reload();
        //username.value = userName;

        await addUser(UserModel(
          email: email.text,
          password: password,
          id: auth.currentUser!.uid,
        ));
        loading.value = false;
        Get.offAll(() => const SplashScreen());
        clearAllFields();
        return user;
      }
    } on FirebaseAuthException catch (e) {
      loading.value = false;
      if (e.code == 'weak-password') {
        errorSnackBar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        errorSnackBar('Error', 'The account already exists for that email.');
      }
      return null;
    } catch (e) {
      loading.value = false;
      debugPrint(e.toString());
      return null;
    }
    loading.value = false;
    return null;
  }

  //sign in
  signIn() async {
    if (loginEmail.text.isEmpty) {
      errorSnackBar("Error", "Please enter your email");
      return null;
    }
    // Check if password and confirmPassword match
    if (loginPassword.text.isEmpty) {
      errorSnackBar("Error", "Please enter a password");
      //  loading.value = true;
      return null;
    }
    try {
      loading.value = true;

      await auth.signInWithEmailAndPassword(
          email: loginEmail.text, password: loginPassword.text);

      Get.offAll(() => const SplashScreen());
      clearAllFields();
      loading.value = false;
    } catch (e) {
      errorSnackBar("error", "$e");
      loading.value = false;
    }
  }

  //add user to database
  addUser(UserModel user) async {
    await db.collection("users").add(user.toMap());
  }

  //Sign out
  signOut() async {
    await auth.signOut();
    Get.offAll(() => SignUpPage());
  }

  clearAllFields() {
    email.clear();
    password.clear();
    loginEmail.clear();
    loginPassword.clear();
  }
}
