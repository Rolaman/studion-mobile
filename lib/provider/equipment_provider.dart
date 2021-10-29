import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';

class EquipmentProvider extends ChangeNotifier {
  List<EquipmentItem> _items = [];
  final Map<String, EquipmentGroup> _groups = {};

  Future<List<EquipmentItem>> get() async {
    if (_groups.isEmpty) {
      CollectionReference studios =
          FirebaseFirestore.instance.collection('equipments');
      QuerySnapshot<Object?> snapshot = await studios.get();
      _items = snapshot.docs.map((e) {
        Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
        return EquipmentItem(
          id: e.id,
          name: firestoreData['name'],
          type: firestoreData['type'],
          imageUrl: firestoreData['imageUrl'],
        );
      }).toList();
      for (var e in _items) {
        if (!_groups.containsKey(e.type)) {
          _groups[e.type] = EquipmentGroup(
            e.type,
            equipmentGroups[e.type]!,
            [],
          );
        }
        _groups[e.type]!.items.add(e);
      }
    }
    return [..._items];
  }

  Future<List<EquipmentItem>> getByIdsAsync(List<String> ids) async {
    if (_items.isEmpty) {
      await get();
    }
    return _items.where((e) => ids.contains(e.id)).toList();
  }
}
