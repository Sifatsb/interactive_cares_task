import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interactive_cares_task/initializer.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await Initializer.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
