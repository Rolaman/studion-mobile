import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studion_mobile/model/studio_dto.dart';

class AllStudioListProvider extends ChangeNotifier {
  List<StudioItem> _items = [];

  Future<void> fetch() async {
    // TODO: url from env var
    final response = await http.get(
      Uri.parse("http://localhost:8080/api/rooms"),
    );
    _items = (jsonDecode(response.body)['items'] as List<dynamic>).map((e) => StudioItem.fromJson(e)).toList();
  }

  List<StudioItem> get() {
    return [..._items];
  }
}