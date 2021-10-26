import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';

class FiltersProvider extends ChangeNotifier {

  final Map<String, EquipmentItem> _equipments = {};

  Future<void> changeEquipment(EquipmentItem item, bool state) async {
    if (!_equipments.containsKey(item.id) && state) {
      _equipments[item.id] = item;
    }
    if (_equipments.containsKey(item.id) && !state) {
      _equipments.remove(item.id);
    }
    notifyListeners();
  }

  bool getState(String id) {
    return _equipments.containsKey(id);
  }

  List<String> getEquipmentFilters() {
    return _equipments.values.map((e) => e.name).toList();
  }
}