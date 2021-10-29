import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';

class FacilitiesProvider extends ChangeNotifier {
  List<FacilityItem> _items = [];

  Future<List<FacilityItem>> get() async {
    if (_items.isEmpty) {
      CollectionReference studios =
      FirebaseFirestore.instance.collection('facilities');
      QuerySnapshot<Object?> snapshot = await studios.get();
      _items = snapshot.docs.map((e) {
        Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
        return FacilityItem(
          e.id,
          firestoreData['name'],
        );
      }).toList();
    }
    return [..._items];
  }

  Future<List<String>> getByIdsAsync(List<String> ids) async {
    if (_items.isEmpty) {
      await get();
    }
    return _items.where((e) => ids.contains(e.id)).map((e) => e.name).toList();
  }

  List<String> getByIds(List<String> ids) {
    return _items.where((e) => ids.contains(e.id)).map((e) => e.name).toList();
  }
}