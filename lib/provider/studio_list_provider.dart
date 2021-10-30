import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/studio_dto.dart';

class StudioListProvider with ChangeNotifier {
  List<StudioItem> _items = [];
  List<StudioItem> _allItems = [];
  bool loading = true;

  Future<void> changeFilters(FilterRequest request) async {
    if (_allItems.isEmpty) {
      await fetchAll();
    }
    _items = _allItems.where((e) {
      if (request.text == null) {
        return true;
      }
      return e.name.contains(request.text!);
    }).toList();
  }

  Future<void> fetchAll() async {
    CollectionReference studios =
        FirebaseFirestore.instance.collection('studios');
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
      List<String> facilities = firestoreData['facilities']
          .cast<DocumentReference>()
          .map((e) => e.id)
          .toList()
          .cast<String>();
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
        price: firestoreData['price'] ?? -1,
        cityId: (firestoreData['cityId'] as DocumentReference).id,
        startHour: firestoreData['startHour'] ?? 0,
        endHour: firestoreData['endHour'] ?? 24,
        // TODO remove below
        calendarUrl: 'https://google.com',
        mobile: '+7(952)210-77-65',

        facilities: facilities,
        siteUrl: firestoreData['siteUrl'],
        vkUrl: firestoreData['vkUrl'],
        instagramUrl: firestoreData['instagramUrl'],
        metros: metros,
      );
    }).toList();
    _items = [..._allItems];
    notifyListeners();
  }

  List<StudioItem> get items {
    return [..._items];
  }

  StudioItem getOne(String id) {
    return _allItems.firstWhere((e) => id == e.id);
  }

  Future<StudioItem> getOneAsync(String id) async {
    if (_allItems.isEmpty) {
      await fetchAll();
    }
    return _allItems.firstWhere((e) => id == e.id);
  }

  List<StudioItem> getCurrents() {
    return [..._items];
  }
}
