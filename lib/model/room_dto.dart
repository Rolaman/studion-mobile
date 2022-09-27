class RoomItem {
  final String id;
  final String name;
  final String? image;
  final String studioId;
  final List<String> images;
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
  final String? calendar;
  final bool best;

  RoomItem({
    required this.id,
    required this.name,
    this.image,
    required this.studioId,
    required this.images,
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
    this.calendar,
    this.best = true,
  });

  factory RoomItem.fromJson(Map<String, dynamic> json) {
    List<String> images = json['images'].cast<String>();
    List<String> equipments = json['equipments'].cast<String>();
    List<String> interiors = json['interiors'].cast<String>();
    List<String> characteristics = json['characteristics'].cast<String>();
    List<String> facilities = json['facilities'].cast<String>();
    return RoomItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      studioId: json['studioId'],
      images: images,
      description: json['description'],
      area: json['area'],
      height: json['height'],
      cityId: json['cityId'],
      equipments: equipments,
      interiors: interiors,
      characteristics: characteristics,
      facilities: facilities,
      price: json['price'],
      address: json['address'],
      // TODO add metro
      metros: [],
      startHour: json['startHour'],
      endHour: json['endHour'],
      calendar: json['calendar'],
      // TODO add best
      best: false,
    );
  }
}
