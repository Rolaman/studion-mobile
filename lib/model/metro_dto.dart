import 'package:flutter/material.dart';

class MetroStationItem {
  final String id;
  final Color color;
  final String name;

  MetroStationItem({
    required this.id,
    required this.color,
    required this.name,
  });

  factory MetroStationItem.fromJson(Map<String, dynamic> json) {
    final color = Color(int.parse(json['color'], radix: 16) + 4278190080);
    return MetroStationItem(
      id: json["id"],
      color: color,
      name: json["name"],
    );
  }
}
