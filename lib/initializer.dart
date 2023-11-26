import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Initializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }
}
