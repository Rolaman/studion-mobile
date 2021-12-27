import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/studio_dto.dart';

class StudioListProvider with ChangeNotifier {
  List<StudioItem> _items = [];
  List<StudioItem> _allItems = [];
  bool loading = true;

  List<StudioItem> getByRequest(FilterRequest request) {
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
      return e.price == null || request.priceFrom! < e.price!;
    }).where((e) {
      if (request.priceTo == null) {
        return true;
      }
      return e.price == null || request.priceTo! > e.price!;
    }).where((e) {
      if (request.metros.isEmpty) {
        return true;
      }
      return request.metros.any((metro) => e.metros.contains(metro));
    }).toList();
    return _items;
  }

  Future<void> fetch() async {
    CollectionReference studios =
        FirebaseFirestore.instance.collection('studios');
    QuerySnapshot<Object?> snapshot = await studios.get();
    _allItems = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      List<String> images = firestoreData['imageUrls'].cast<String>();
      List<String> equipments = firestoreData['equipments'].cast<String>();
      List<String> interiors = firestoreData['interiors'].cast<String>();
      List<String> characteristics =
          firestoreData['characteristics'].cast<String>();
      List<String> facilities = firestoreData['facilities'].cast<String>();
      List<String> metros = firestoreData['metros'].cast<String>();
      return StudioItem(
        id: e.id,
        name: firestoreData['name'],
        imageUrl: firestoreData['imageUrl'],
        imageUrls: images,
        description: firestoreData['description'],
        address: firestoreData['address'],
        equipments: equipments,
        interiors: interiors,
        characteristics: characteristics,
        area: firestoreData['area'],
        height: firestoreData['height'],
        price: firestoreData['price'],
        cityId: firestoreData['cityId'],
        startHour: firestoreData['startHour'] ?? 0,
        endHour: firestoreData['endHour'] ?? 24,
        calendarUrl: firestoreData['calendarUrl'],
        mobile: firestoreData['mobile'],
        facilities: facilities,
        siteUrl: firestoreData['siteUrl'],
        vkUrl: firestoreData['vkUrl'],
        instagramUrl: firestoreData['instagramUrl'],
        metros: metros,
        pathInstruction: firestoreData['pathInstruction'],
        popular: firestoreData['popular'],
      );
    }).toList();
    _items = [..._allItems];
    notifyListeners();
  }

  List<StudioItem> get items {
    return [..._items];
  }

  List<StudioItem> get popular {
    return [...items.where((e) => e.popular)];
  }

  StudioItem getOne(String id) {
    return _allItems.firstWhere((e) => id == e.id);
  }

  Future<StudioItem> getOneAsync(String id) async {
    if (_allItems.isEmpty) {
      await fetch();
    }
    return _allItems.firstWhere((e) => id == e.id);
  }

  List<StudioItem> getCurrents() {
    return [..._items];
  }
}
