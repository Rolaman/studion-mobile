import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studion_mobile/model/studio/studio_dto.dart';

class StudioListProvider with ChangeNotifier {
  Future<StudioListResponse> get(StudioListRequest request) async {
    CollectionReference studios = FirebaseFirestore.instance
        .collection('studios');
    QuerySnapshot<Object?> snapshot = await studios.get();
    List<StudioItem> items = snapshot.docs.map((e) {
      Map<String, dynamic> firestoreData = e.data() as Map<String, dynamic>;
      return StudioItem(firestoreData['name'], firestoreData['imageUrl']);
    }).toList();
    return StudioListResponse(items);
  }
}
