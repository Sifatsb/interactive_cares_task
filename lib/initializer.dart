import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_task/app/utilities/widgets/loader/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    _initGlobalLoading();
  }

  static void _initGlobalLoading() {
    final loading = LoadingController();
    Get.put(loading);
  }

}
