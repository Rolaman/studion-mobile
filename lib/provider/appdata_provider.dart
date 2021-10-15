import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AppDataProvider with ChangeNotifier {
  late bool loaded = false;

  Future<void> fetch() async {
    if (loaded) {
      return;
    }
    await Firebase.initializeApp();
    loaded = true;
  }
}
