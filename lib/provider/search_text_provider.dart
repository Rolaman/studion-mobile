import 'package:flutter/material.dart';

class SearchTextProvider extends ChangeNotifier {

  final textController = TextEditingController();

  void change(bool state) {
    notifyListeners();
  }

  void discard() {
    textController.clear();
    notifyListeners();
  }

}