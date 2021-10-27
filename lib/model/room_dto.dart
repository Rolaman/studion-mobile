import 'package:studion_mobile/model/metro_dto.dart';

class RoomItem {
  final String id;
  final String name;
  final String? imageUrl;
  final String studioId;
  final List<String> imageUrls;
  final String? description;
  final int area;
  final int height;
  final String cityId;
  final List<String> equipments;
  final List<String> interiors;
  final List<String> characteristics;
  final int price;
  final String address;
  final List<String> metros;

  RoomItem({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.studioId,
    required this.imageUrls,
    this.description,
    required this.area,
    required this.height,
    required this.cityId,
    this.equipments = const [],
    this.interiors = const [],
    this.characteristics = const [],
    required this.price,
    required this.address,
    this.metros = const [],
  });
}
