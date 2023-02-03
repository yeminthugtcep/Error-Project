import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randomdog/main.dart';
import 'package:google_sign_in/google_sign_in.dart' as googlePackage;

class AuthController extends GetxController {
  final email = TextEditingController(), password = TextEditingController();
  final authForm = GlobalKey<FormState>();
  final focusNode = FocusNode();

  final registorAuth = FirebaseAuth.instance;

  bool isLoading = false;
  bool islogging = false;
  @override
  void onClose() {
    authForm.currentState?.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  Future<void> registor() async {
    if (authForm.currentState?.validate() != true) return;
    if (islogging) return;
    islogging = true;
    isLoading = true;
    update(["loading"]);
    try {
      final UserCredential userCredential =
          await registorAuth.createUserWithEmailAndPassword(
              email: email.text, password: password.text);
      //logOutController();//rigistorလုပ်ပီးတာနဲ့ logoutဖစ်အောင်
      Get.offAllNamed(homeRoute);
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      update(["loading"]);
      print("registor FirebaseAuthExeption error ${e.message}");
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 3),
        title: "Faild to registor",
        message: e.message ?? e.code,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ));
    } catch (error) {
      isLoading = false;
      update(["loading"]);
      print("register General error $error");
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 3),
        title: "Faild to registor",
        message: error.toString(),
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ));
    }
  }

  Future<void> logOut() async {
    //rigistorလုပ်ပီးတာနဲ့ logoutဖစ်အောင်
    await registorAuth.signOut();
  }

  Future<void> login() async {
    if (authForm.currentState?.validate() != true) return;
    if (islogging) return;
    isLoading = true;
    update(["loading"]);
    try {
      final UserCredential userCredential =
          await registorAuth.signInWithEmailAndPassword(
              email: email.text, password: password.text);
      //logOutController();//rigistorလုပ်ပီးတာနဲ့ logoutဖစ်အောင်
      Get.offAllNamed(homeRoute);
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      update(["loading"]);
      print("registor FirebaseAuthExeption error ${e.message}");
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 3),
        title: "Faild to registor",
        message: e.message ?? e.code,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ));
    } catch (error) {
      isLoading = false;
      update(["loading"]);
      print("register General error $error");
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 3),
        title: "Faild to registor",
        message: error.toString(),
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ));
    }
    islogging = false;
  }

  final googleSignIn = googlePackage.GoogleSignIn();
  Future<void> loginWithGoogle() async {
    if (islogging) return;
    islogging = true;
    try {
      //await googleSignIn.signOut();
      final googleAccount = await googleSignIn.signIn();
      isLoading = true;
      update(["loading"]);
      print("google account ${googleAccount.toString()}");
      final googleAuth = await googleAccount?.authentication;
      await googleSignIn.signOut();
      final userCredential = await registorAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth?.idToken,
              accessToken: googleAuth?.accessToken));
      isLoading = false;
      update(["loading"]);
      Get.offAllNamed(homeRoute);
      print("registor success ${userCredential.toString()}");
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      update(["loading"]);
      print("registor FirebaseAuthExeption error ${e.message}");
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 3),
        title: "Faild to registor",
        message: e.message ?? e.code,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ));
    } catch (error) {
      isLoading = false;
      update(["loading"]);
      print("register General error $error");
      Get.showSnackbar(GetSnackBar(
        duration: const Duration(seconds: 3),
        title: "Faild to registor",
        message: error.toString(),
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ));
    }
    islogging = false;
  }
}
