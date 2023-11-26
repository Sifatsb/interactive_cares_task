import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_task/app/routes/app_pages.dart';
import 'package:interactive_cares_task/app/utilities/message/snack_bars.dart';
import 'package:interactive_cares_task/app/utilities/widgets/loader/loading.controller.dart';

class SignUpController extends GetxController {
  LoadingController loadingController = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  RxBool isObscureText = true.obs;

  bool validate() {
    String email = emailTextController.text;
    String password = passwordTextController.text;
    if (email.isEmpty) {
      showBasicFailedSnackBar(message: 'Enter email');
      return false;
    } else if (password.isEmpty) {
      showBasicFailedSnackBar(message: 'Enter password');
      return false;
    }
    return true;
  }

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      loadingController.isLoading = true;
      UserCredential? userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential != null) {
        loadingController.isLoading = false;
        Get.toNamed(Routes.HOME);
      } else {
        loadingController.isLoading = false;
        showBasicFailedSnackBar(message: 'Something went wrong');
      }
    } catch (e, t) {
      loadingController.isLoading = false;
      showBasicFailedSnackBar(message: 'Something went wrong');
      debugPrint('$e');
      debugPrint('$t');
    } finally {
      loadingController.isLoading = false;
    }
  }
}
