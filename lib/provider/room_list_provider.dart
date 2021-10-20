import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/room_dto.dart';

class RoomListProvider with ChangeNotifier {
  List<RoomItem> _items = [];
  List<RoomItem> _allItems = [];

  Future<void> get(RoomListRequest request) async {
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
        FirebaseFirestore.instance.collection('rooms');
    QuerySnapshot<Object?> snapshot = await studios.get();
    _allItems = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      return RoomItem(firestoreData['name'], firestoreData['imageUrl'],
          (firestoreData['studioId'] as DocumentReference).id);
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

  List<RoomItem> get items {
    return [..._items];
  }
}
