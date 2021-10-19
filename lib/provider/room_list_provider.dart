import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/room_dto.dart';

class RoomListProvider with ChangeNotifier {
  List<RoomItem> _items = [];

  Future<void> get(RoomListRequest request) async {
    CollectionReference studios =
        FirebaseFirestore.instance.collection('rooms');
    QuerySnapshot<Object?> snapshot = await studios.get();
    List<RoomItem> items = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      return RoomItem(firestoreData['name'], firestoreData['imageUrl'],
          firestoreData['studioId']);
    }).where((e) {
      if (request.text == null) {
        return true;
      }
      return e.name.contains(request.text!);
    }).toList();
    _items = items;
    notifyListeners();
  }

  List<RoomItem> get items {
    return [..._items];
  }
}
