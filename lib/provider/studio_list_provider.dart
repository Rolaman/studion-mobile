import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/studio_dto.dart';

class StudioListProvider with ChangeNotifier {
  List<StudioItem> _items = [];
  List<StudioItem> _allItems = [];

  Future<void> get(StudioListRequest request) async {
    if (_allItems.isEmpty) {
      await _fetchAll();
    }
    _items = _allItems.where((e) {
      if (request.text == null) {
        return true;
      }
      return e.name.contains(request.text!);
    }).toList();
  }

  Future<void> _fetchAll() async {
    CollectionReference studios =
        FirebaseFirestore.instance.collection('studios');
    QuerySnapshot<Object?> snapshot = await studios.get();
    _allItems = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      List<String> images = firestoreData['imageUrls'].cast<String>();
      return StudioItem(
        e.id,
        firestoreData['name'],
        firestoreData['imageUrl'],
        images,
        firestoreData['description'],
      );
    }).toList();
  }

  List<StudioItem> get items {
    return [..._items];
  }

  StudioItem getOne(String id) {
    return _allItems.firstWhere((e) => id == e.id);
  }
}
