import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';

class FiltersProvider extends ChangeNotifier {
  final Map<String, EquipmentItem> _equipments = {};
  final Map<String, InteriorItem> _interiors = {};
  final Map<String, CharacteristicItem> _characteristics = {};

  Future<void> changeEquipment(EquipmentItem item, bool state) async {
    if (!_equipments.containsKey(item.id) && state) {
      _equipments[item.id] = item;
    }
    if (_equipments.containsKey(item.id) && !state) {
      _equipments.remove(item.id);
    }
    notifyListeners();
  }

  bool getEquipmentState(String id) {
    return _equipments.containsKey(id);
  }

  List<String> getEquipmentFilters() {
    return _equipments.values.map((e) => e.name).toList();
  }

  List<String> getEquipmentFilterIds() {
    return _equipments.values.map((e) => e.id).toList();
  }

  Future<void> changeInterior(InteriorItem item, bool state) async {
    if (!_interiors.containsKey(item.id) && state) {
      _interiors[item.id] = item;
    }
    if (_interiors.containsKey(item.id) && !state) {
      _interiors.remove(item.id);
    }
    notifyListeners();
  }

  bool getInteriorState(String id) {
    return _interiors.containsKey(id);
  }

  List<String> getInteriorFilters() {
    return _interiors.values.map((e) => e.name).toList();
  }

  List<String> getInteriorFilterIds() {
    return _interiors.values.map((e) => e.id).toList();
  }


  Future<void> changeCharacteristic(CharacteristicItem item, bool state) async {
    if (!_characteristics.containsKey(item.id) && state) {
      _characteristics[item.id] = item;
    }
    if (_characteristics.containsKey(item.id) && !state) {
      _characteristics.remove(item.id);
    }
    notifyListeners();
  }

  bool getCharacteristicState(String id) {
    return _characteristics.containsKey(id);
  }

  List<String> getCharacteristicFilters() {
    return _characteristics.values.map((e) => e.name).toList();
  }

  List<String> getCharacteristicFilterIds() {
    return _characteristics.values.map((e) => e.id).toList();
  }
}
