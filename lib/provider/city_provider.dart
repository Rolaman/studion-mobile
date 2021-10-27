import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/city_dto.dart';

class CityProvider extends ChangeNotifier {
  CityItem? _choosen;
  List<CityItem> _cities = [];

  Future<List<CityItem>> getAll() async {
    if (_cities.isNotEmpty) {
      return _cities;
    }
    await _fetchAll();
    return _cities;
  }

  Future<CityItem> getCurrent() async {
    if (_choosen != null) {
      return _choosen!;
    }
    if (_cities.isEmpty) {
      await _fetchAll();
    }
    return _cities.firstWhere((e) => e.id == 'moscow');
  }

  CityItem? getCurrentSync() {
    try {
      if (_choosen != null) {
        return _choosen!;
      }
      return _cities.firstWhere((e) => e.id == 'moscow');
    } catch (e) {
      return null;
    }
  }

  Future<void> change(String id) async {
    _choosen = _cities.firstWhere((e) => id == e.id);
    notifyListeners();
  }

  Future<void> _fetchAll() async {
    CollectionReference studios =
        FirebaseFirestore.instance.collection('cities');
    QuerySnapshot<Object?> snapshot = await studios.get();
    _cities = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      return CityItem(
        e.id,
        firestoreData['name'],
      );
    }).toList();
  }
}
