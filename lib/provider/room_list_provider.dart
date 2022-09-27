import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/filters_dto.dart';
import '../model/room_dto.dart';

class RoomListProvider extends ChangeNotifier {
  List<RoomItem> _allItems = [];
  List<RoomItem> _items = [];

  Future<void> fetch() async {
    // TODO: url from env var
    final response = await http.get(
      Uri.parse("http://localhost:8080/api/room"),
    );
    _allItems = (jsonDecode(response.body)['items'] as List<dynamic>)
        .map((e) => RoomItem.fromJson(e))
        .toList();
    _items = [..._items];
  }

  List<RoomItem> get all {
    return [..._allItems];
  }

  List<RoomItem> get best {
    return [..._allItems.where((e) => e.best)];
  }

  List<RoomItem> byStudioId(String studioId) {
    return _allItems.where((e) => e.studioId == studioId).toList();
  }

  RoomItem byId(String id) {
    return _allItems.firstWhere((e) => e.id == id);
  }

  List<RoomItem> get currents {
    return [..._items];
  }

  List<RoomItem> byRequest(FilterRequest request) {
    _items = _allItems.where((e) {
      if (request.text == null) {
        return true;
      }
      return e.name.toLowerCase().contains(request.text!.toLowerCase());
    }).where((e) {
      if (request.cityId == null) {
        return true;
      }
      return e.cityId == request.cityId;
    }).where((e) {
      if (request.equipments.isEmpty) {
        return true;
      }
      bool matchForAny = true;
      if (request.equipments.any((eq) => eq == 'impulse-any')) {
        matchForAny = e.equipments.any((eq) => eq.contains('impulse'));
      }
      if (request.equipments.any((eq) => eq == 'constant-any')) {
        matchForAny =
            matchForAny && e.equipments.any((eq) => eq.contains('constant'));
      }
      return request.equipments.where((eq) => !eq.contains('-any')).every((eq) {
            return e.equipments.contains(eq);
          }) &&
          matchForAny;
    }).where((e) {
      if (request.interiors.isEmpty) {
        return true;
      }
      return request.interiors.every((eq) {
        return e.interiors.contains(eq);
      });
    }).where((e) {
      if (request.characteristics.isEmpty) {
        return true;
      }
      return request.characteristics.every((eq) {
        return e.characteristics.contains(eq);
      });
    }).where((e) {
      if (request.facilities.isEmpty) {
        return true;
      }
      return request.facilities.every((eq) {
        return e.facilities.contains(eq);
      });
    }).where((e) {
      if (request.priceFrom == null) {
        return true;
      }
      return request.priceFrom! <= e.price;
    }).where((e) {
      if (request.priceTo == null) {
        return true;
      }
      return request.priceTo! >= e.price;
    }).where((e) {
      if (request.metros.isEmpty) {
        return true;
      }
      return request.metros.any((metro) => e.metros.contains(metro));
    }).toList();
    return [..._items];
  }
}
