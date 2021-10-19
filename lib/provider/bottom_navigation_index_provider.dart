import 'package:flutter/material.dart';

class BottomNavigationIndexProvider extends ChangeNotifier {

  int _selectedIndex = 0;

  Future<void> change(int index) async {
    _selectedIndex = index;
    notifyListeners();
  }

  int get selectedIndex {
    return _selectedIndex;
  }

}