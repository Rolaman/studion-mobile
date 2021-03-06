import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/room_dto.dart';

class RoomListProvider with ChangeNotifier {
  List<RoomItem> _items = [];
  List<RoomItem> _allItems = [];

  List<RoomItem> getByRequest(FilterRequest request) {
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
        matchForAny = matchForAny && e.equipments.any((eq) => eq.contains('constant'));
      }
      return request.equipments.where((eq) => !eq.contains('-any')).every((eq) {
        return e.equipments.contains(eq);
      }) && matchForAny;
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
    return _items;
  }

  List<RoomItem> getCurrents() {
    return [..._items];
  }

  Future<void> fetch() async {
    CollectionReference studios =
        FirebaseFirestore.instance.collection('rooms');
    QuerySnapshot<Object?> snapshot = await studios.get();
    _allItems = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      List<String> images = firestoreData['imageUrls'].cast<String>();
      List<String> metros = firestoreData['metros'].cast<String>();
      List<String> equipments = firestoreData['equipments']
          .cast<String>();
      List<String> interiors = firestoreData['interiors']
          .cast<String>();
      List<String> characteristics = firestoreData['characteristics']
          .cast<String>();
      List<String> facilities = firestoreData['facilities']
          .cast<String>();
      return RoomItem(
        id: e.id,
        name: firestoreData['name'],
        imageUrl: firestoreData['imageUrl'],
        studioId: firestoreData['studioId'],
        imageUrls: images,
        description: firestoreData['description'],
        area: firestoreData['area'],
        height: firestoreData['height'],
        cityId: firestoreData['cityId'],
        price: firestoreData['price'],
        equipments: equipments,
        interiors: interiors,
        characteristics: characteristics,
        facilities: facilities,
        address: firestoreData['address'],
        metros: metros,
        startHour: firestoreData['startHour'],
        endHour: firestoreData['endHour'],
        calendarUrl: firestoreData['calendarUrl'],
        best: firestoreData['best'],
      );
    }).toList();
    _items = [..._allItems];
  }

  List<RoomItem> getByStudioId(String studioId) {
    return _allItems.where((e) {
      if (e.studioId == studioId) {
        return true;
      }
      return false;
    }).toList();
  }

  RoomItem getOne(String id) {
    return _allItems.firstWhere((e) => e.id == id);
  }

  List<RoomItem> get items {
    return [..._items];
  }

  List<RoomItem> get best {
    return [..._allItems.where((e) => e.best)];
  }
}
