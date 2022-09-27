import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/studio_dto.dart';

class StudioListProvider with ChangeNotifier {
  List<StudioItem> _items = [];
  List<StudioItem> _allItems = [];

  Future<void> fetch() async {
    // TODO: url from env var
    final response = await http.get(
      Uri.parse("http://localhost:8080/api/studio"),
    );
    _allItems = (jsonDecode(response.body)['items'] as List<dynamic>)
        .map((e) => StudioItem.fromJson(e))
        .toList();
    _items = [..._allItems];
    notifyListeners();
  }

  List<StudioItem> get currents {
    return [..._items];
  }

  List<StudioItem> get popular {
    return [..._items.where((e) => e.popular)];
  }

  StudioItem byId(String id) {
    return _allItems.firstWhere((e) => id == e.id);
  }

  List<StudioItem> byRequest(FilterRequest request) {
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
      return e.price == null || request.priceFrom! <= e.price!;
    }).where((e) {
      if (request.priceTo == null) {
        return true;
      }
      return e.price == null || request.priceTo! >= e.price!;
    }).where((e) {
      if (request.metros.isEmpty) {
        return true;
      }
      return request.metros.any((metro) => e.metros.contains(metro));
    }).toList();
    return _items;
  }
}
