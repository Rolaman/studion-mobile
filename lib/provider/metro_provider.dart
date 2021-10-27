import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:studion_mobile/model/metro_dto.dart';
import 'package:http/http.dart' as http;

class MetroProvider extends ChangeNotifier {
  final Map<String, List<MetroStationItem>> _cityStations = {};

  Future<void> fetch(List<String> cityIds) async {
    for (var cityId in cityIds) {
      final cityMetroId = cityMetroIds[cityId];
      final response =
          await http.get(Uri.parse('https://api.hh.ru/metro/$cityMetroId'));
      var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final lines = decodedResponse['lines'] as List<dynamic>;
      List<MetroStationItem> result = [];
      for (var line in lines) {
        final color = Color(int.parse(line['hex_color'], radix: 16));
        final stations = line['stations'] as List<dynamic>;
        for (var station in stations) {
          result.add(MetroStationItem(
              id: station['id'], color: color, name: station['name']));
        }
      }
      _cityStations[cityId] = result;
    }
  }

  List<MetroStationItem> getByCityId(String cityId) {
    return [..._cityStations[cityId]!];
  }

  List<MetroStationItem> getByIds(String cityId, List<String> ids) {
    return _cityStations[cityId]!
        .where((e) => ids.contains(e.id))
        .toList();
  }
}

const cityMetroIds = {
  'moscow': 1,
  'spb': 2,
};
