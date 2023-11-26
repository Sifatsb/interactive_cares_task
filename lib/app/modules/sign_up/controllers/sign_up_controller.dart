import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_task/app/utilities/message/snack_bars.dart';
import 'package:interactive_cares_task/app/utilities/widgets/loader/loading.controller.dart';

class SignUpController extends GetxController {
  LoadingController loadingController = Get.find();

  TextEditingController emailTextController=TextEditingController();
  TextEditingController passwordTextController=TextEditingController();

  RxBool isObscureText = true.obs;

  bool validate() {
    String email=emailTextController.text;
    String password=passwordTextController.text;
    if(email.isEmpty){
      showBasicFailedSnackBar(message: 'Enter email');
      return false;
    }
    else if(password.isEmpty){
      showBasicFailedSnackBar(message: 'Enter password');
      return false;
    }
    return true;
  }
}
