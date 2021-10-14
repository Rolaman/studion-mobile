import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AppDataProvider with ChangeNotifier {

  late bool loaded;
  late FirebaseFirestore _firestore;

  Future<void> fetch() async {
    await Firebase.initializeApp(name: 'studion-dev');
    _firestore = FirebaseFirestore.instance;
    loaded = true;
  }
}
