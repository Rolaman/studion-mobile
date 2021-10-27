import 'package:flutter/material.dart';

class SearchTextTypeProvider extends ChangeNotifier {

  final textController = TextEditingController();
  bool searchText = false;

  void change(bool state) {
    searchText = state;
    notifyListeners();
  }

}