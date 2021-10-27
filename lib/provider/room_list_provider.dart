import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/room_dto.dart';

class RoomListProvider with ChangeNotifier {
  List<RoomItem> _items = [];
  List<RoomItem> _allItems = [];

  Future<List<RoomItem>> get(FilterRequest request) async {
    if (_allItems.isEmpty) {
      await _fetchAll();
    }
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
      return request.equipments.every((eq) {
        return e.equipments.contains(eq);
      });
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
      if (request.priceFrom == null) {
        return true;
      }
      return request.priceFrom! < e.price;
    }).where((e) {
      if (request.priceTo == null) {
        return true;
      }
      return request.priceTo! > e.price;
    }).toList();
    notifyListeners();
    print(_items);
    return _items;
  }

  Future<void> _fetchAll() async {
    CollectionReference studios =
        FirebaseFirestore.instance.collection('rooms');
    QuerySnapshot<Object?> snapshot = await studios.get();
    _allItems = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      List<String> images = firestoreData['imageUrls'].cast<String>();
      List<String> equipments = firestoreData['equipments']
          .cast<DocumentReference>()
          .map((e) => e.id)
          .toList()
          .cast<String>();
      List<String> interiors = firestoreData['interiors']
          .cast<DocumentReference>()
          .map((e) => e.id)
          .toList()
          .cast<String>();
      List<String> characteristics = firestoreData['characteristics']
          .cast<DocumentReference>()
          .map((e) => e.id)
          .toList()
          .cast<String>();
      return RoomItem(
        id: e.id,
        name: firestoreData['name'],
        imageUrl: firestoreData['imageUrl'],
        studioId: (firestoreData['studioId'] as DocumentReference).id,
        imageUrls: images,
        description: firestoreData['description'],
        area: firestoreData['area'],
        height: firestoreData['height'],
        cityId: (firestoreData['cityId'] as DocumentReference).id,
        price: firestoreData['price'],
        equipments: equipments,
        interiors: interiors,
        characteristics: characteristics,
      );
    }).toList();
  }

  Future<List<RoomItem>> getByStudioId(String studioId) async {
    if (_allItems.isEmpty) {
      await _fetchAll();
    }
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
}
