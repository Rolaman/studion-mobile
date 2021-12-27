import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/filters_dto.dart';

class EquipmentProvider extends ChangeNotifier {
  List<EquipmentItem> _items = [];
  Map<String, EquipmentGroup> _groups = {};

  List<EquipmentItem> get() {
    return [
      ..._groups['other']!.items,
      ..._groups['constant']!.items,
      ..._groups['impulse']!.items,
    ];
  }

  Future<void> fetch() async {
    final Map<String, EquipmentGroup> newGroup = {};
    equipmentGroups.forEach((k, v) {
      newGroup[k] = EquipmentGroup(k, v, []);
    });
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
    _items.sort((e1, e2) {
      if (e1.name == 'Любой') {
        return -1;
      }
      if (e2.name == 'Любой') {
        return 1;
      }
      return 0;
    });
    for (var e in _items) {
      newGroup[e.type]!.items.add(e);
    }
    _groups = newGroup;
  }

  Future<List<EquipmentItem>> getByIdsAsync(List<String> ids) async {
    if (_items.isEmpty) {
      await fetch();
    }
    return _items.where((e) => ids.contains(e.id)).toList();
  }
}
