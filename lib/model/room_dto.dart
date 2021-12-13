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
  final List<String> facilities;
  final int price;
  final String address;
  final List<String> metros;
  final int startHour;
  final int endHour;
  final String? calendarUrl;
  final bool best;

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
    this.facilities = const [],
    required this.price,
    required this.address,
    this.metros = const [],
    this.startHour = 0,
    this.endHour = 0,
    this.calendarUrl,
    this.best = true,
  });
}
