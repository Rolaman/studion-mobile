class StudioItem {
  final String id;
  final String name;
  final String? image;
  final List<String> images;
  final String? description;
  final String? address;
  final int area;
  final int height;
  final int? price;
  final String cityId;
  final List<String> equipments;
  final List<String> interiors;
  final List<String> characteristics;
  final List<String> facilities;
  final int openHour;
  final int closeHour;
  final String? calendar;
  final String? mobile;
  final String? url;
  final String? vk;
  final String? instagram;
  // TODO add facebook to screen
  final String? facebook;
  final List<String> metros;
  final String? instruction;
  final double rating;
  final bool popular;

  StudioItem({
    required this.id,
    required this.name,
    this.image,
    this.images = const [],
    this.description,
    required this.address,
    required this.area,
    required this.height,
    required this.price,
    required this.cityId,
    this.equipments = const [],
    this.interiors = const [],
    this.characteristics = const [],
    this.facilities = const [],
    required this.openHour,
    required this.closeHour,
    this.calendar,
    this.mobile,
    this.url,
    this.vk,
    this.instagram,
    this.facebook,
    this.metros = const [],
    this.instruction,
    // TODO: add rating
    this.rating = 4.5,
    this.popular = true,
  });

  factory StudioItem.fromJson(Map<String, dynamic> json) {
    List<String> images = json['images'].cast<String>();
    List<String> equipments = json['equipments'].cast<String>();
    List<String> interiors = json['interiors'].cast<String>();
    List<String> characteristics = json['characteristics'].cast<String>();
    List<String> facilities = json['facilities'].cast<String>();
    return StudioItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      images: images,
      description: json['description'],
      address: json['address'],
      area: json['area'],
      height: json['height'],
      price: json['price'],
      cityId: json['cityId'],
      interiors: interiors,
      characteristics: characteristics,
      equipments: equipments,
      facilities: facilities,
      openHour: json['openHour'],
      closeHour: json['closeHour'],
      calendar: json['calendar'],
      mobile: json['mobile'],
      url: json['url'],
      instagram: json['instagram'],
      vk: json['vk'],
      // TODO: add metro
      metros: [],
      instruction: json['instruction'],
      rating: json['rating'],
      popular: json['popular'],
      facebook: json['facebook'],
    );
  }
}
