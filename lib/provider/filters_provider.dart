import 'package:flutter/material.dart';

class FiltersProvider extends ChangeNotifier {

  final List<String> _equipments = [];

  Future<void> changeEquipment(String id, bool state) async {
    if (!_equipments.contains(id) && state) {
      _equipments.add(id);
    }
    if (_equipments.contains(id) && !state) {
      _equipments.remove(id);
    }
    notifyListeners();
  }

  bool getState(String id) {
    return _equipments.contains(id);
  }
}