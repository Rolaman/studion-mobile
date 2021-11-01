import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/metro_dto.dart';

class FiltersProvider extends ChangeNotifier {
  final Map<String, EquipmentItem> _equipments = {};
  final Map<String, InteriorItem> _interiors = {};
  final Map<String, CharacteristicItem> _characteristics = {};
  final Map<String, MetroStationItem> _metros = {};
  final Map<String, FacilityItem> _facilities = {};

  Future<void> changeEquipment(EquipmentItem item) async {
    if (!_equipments.containsKey(item.id)) {
      _equipments[item.id] = item;
    } else {
      _equipments.remove(item.id);
    }
    notifyListeners();
  }

  bool getEquipmentState(String id) {
    return _equipments.containsKey(id);
  }

  List<EquipmentItem> getEquipmentFilters() {
    return _equipments.values.toList();
  }

  List<String> getEquipmentFilterIds() {
    return _equipments.values.map((e) => e.id).toList();
  }

  Future<void> changeInterior(InteriorItem item) async {
    if (!_interiors.containsKey(item.id)) {
      _interiors[item.id] = item;
    } else {
      _interiors.remove(item.id);
    }
    notifyListeners();
  }

  List<String> getInteriorFilters() {
    return _interiors.values.map((e) => e.name).toList();
  }

  List<String> getInteriorFilterIds() {
    return _interiors.values.map((e) => e.id).toList();
  }

  Future<void> changeCharacteristic(CharacteristicItem item) async {
    if (!_characteristics.containsKey(item.id)) {
      _characteristics[item.id] = item;
    } else {
      _characteristics.remove(item.id);
    }
    notifyListeners();
  }

  List<String> getCharacteristicFilters() {
    return _characteristics.values.map((e) => e.name).toList();
  }

  List<String> getCharacteristicFilterIds() {
    return _characteristics.values.map((e) => e.id).toList();
  }

  Future<void> changeMetro(MetroStationItem item, bool state) async {
    if (!_metros.containsKey(item.id) && state) {
      _metros[item.id] = item;
    }
    if (_metros.containsKey(item.id) && !state) {
      _metros.remove(item.id);
    }
    notifyListeners();
  }

  List<String> getMetroFilters() {
    return _metros.values.map((e) => e.name).toList();
  }

  List<String> getMetroFilterIds() {
    return _metros.values.map((e) => e.id).toList();
  }

  Future<void> changeFacilities(FacilityItem item) async {
    if (!_facilities.containsKey(item.id)) {
      _facilities[item.id] = item;
    } else {
      _facilities.remove(item.id);
    }
    notifyListeners();
  }

  List<String> getFacilitiesFilters() {
    return _facilities.values.map((e) => e.name).toList();
  }

  List<String> getFacilitiesFilterIds() {
    return _facilities.values.map((e) => e.id).toList();
  }

  void discard() {
    _equipments.clear();
    _interiors.clear();
    _characteristics.clear();
    _metros.clear();
    _facilities.clear();
    notifyListeners();
  }

  void discardMetro() {
    _metros.clear();
    notifyListeners();
  }

  bool hasActiveFilters() {
    return _equipments.isNotEmpty ||
        _interiors.isNotEmpty ||
        _characteristics.isNotEmpty ||
        _metros.isNotEmpty ||
        _facilities.isNotEmpty;
  }
}
