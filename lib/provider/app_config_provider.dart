import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studion_mobile/model/filters_dto.dart';
import '../model/config.dart';

class AppConfigProvider extends ChangeNotifier {
  late AppConfig config;

  Future<void> fetch() async {
    // TODO: url from env var
    final response = await http.get(
      Uri.parse("http://localhost:8080/api/config"),
    );
    config = AppConfig.fromJson(jsonDecode(response.body));
  }

  List<InteriorItem> iteriorsByIds(List<String> ids) {
    return config.interiors.where((e) => ids.contains(e.id)).toList();
  }

  List<CharacteristicItem> characteristicsByIds(List<String> ids) {
    return config.characteristics.where((e) => ids.contains(e.id)).toList();
  }

  List<EquipmentItem> equipmentsByIds(List<String> ids) {
    return config.equipments.where((e) => ids.contains(e.id)).toList();
  }

  List<FacilityItem> facilitiesByIds(List<String> ids) {
    return config.facilities.where((e) => ids.contains(e.id)).toList();
  }
}
