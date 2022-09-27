import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:studion_mobile/model/metro_dto.dart';
import 'package:http/http.dart' as http;

class MetroProvider extends ChangeNotifier {
  List<MetroStationItem> _stations = [];

  Future<void> fetch(String cityId) async {
    // TODO: url from env var
    final response = await http.get(
      Uri.parse("http://localhost:8080/api/metro/$cityId"),
    );
    _stations =
        (jsonDecode(response.body)['items'] as List<dynamic>)
            .map((e) => MetroStationItem.fromJson(e))
            .toList();
  }

  List<MetroStationItem> get() {
    return [..._stations];
  }

  List<MetroStationItem> byIds(List<String> stationIds) {
    return _stations.where((e) => stationIds.contains(e.id)).toList();
  }
}
