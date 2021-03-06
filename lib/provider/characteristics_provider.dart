import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';

class CharacteristicProvider extends ChangeNotifier {
  List<CharacteristicItem> _items = [];

  List<CharacteristicItem> get() {
    return [..._items];
  }

  Future<void> fetch() async {
    CollectionReference studios =
    FirebaseFirestore.instance.collection('characteristics');
    QuerySnapshot<Object?> snapshot = await studios.get();
    _items = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      return CharacteristicItem(
        e.id,
        firestoreData['name'],
      );
    }).toList();
  }


  Future<List<String>> getByIdsAsync(List<String> ids) async {
    if (_items.isEmpty) {
      await get();
    }
    return _items.where((e) => ids.contains(e.id)).map((e) => e.name).toList();
  }
}
