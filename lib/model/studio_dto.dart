class StudioItem {
  final String id;
  final String name;
  final String? imageUrl;
  final List<String> imageUrls;
  final String? description;
  final String address;
  final int area;
  final int height;
  final int price;
  final String cityId;
  final List<String> equipments;
  final List<String> interiors;
  final List<String> characteristics;
  final int startHour;
  final int endHour;
  final String? calendarUrl;
  final String? mobile;
  final List<String> facilities;
  final String? siteUrl;
  final String? vkUrl;
  final String? instagramUrl;

  StudioItem({
    required this.id,
    required this.name,
    this.imageUrl,
    this.imageUrls = const [],
    this.description,
    required this.address,
    this.equipments = const [],
    required this.area,
    required this.height,
    required this.price,
    required this.cityId,
    this.interiors = const [],
    this.characteristics = const [],
    required this.startHour,
    required this.endHour,
    this.calendarUrl,
    this.mobile,
    this.facilities = const [],
    this.siteUrl,
    this.vkUrl,
    this.instagramUrl,
  });
}
