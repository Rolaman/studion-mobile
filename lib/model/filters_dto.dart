class EquipmentItem {
  final String id;
  final String name;
  final String type;
  final String? image;

  EquipmentItem({
    required this.id,
    required this.name,
    required this.type,
    this.image,
  });

  factory EquipmentItem.fromJson(Map<String, dynamic> json) {
    return EquipmentItem(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      image: json['image'],
    );
  }
}

class EquipmentGroup {
  final String id;
  final String name;
  final List<EquipmentItem> items;

  EquipmentGroup(this.id, this.name, this.items);
}

class InteriorItem {
  final String id;
  final String name;

  InteriorItem({
    required this.id,
    required this.name,
  });

  factory InteriorItem.fromJson(Map<String, dynamic> json) {
    return InteriorItem(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CharacteristicItem {
  final String id;
  final String name;

  CharacteristicItem({
    required this.id,
    required this.name,
  });

  factory CharacteristicItem.fromJson(Map<String, dynamic> json) {
    return CharacteristicItem(
      id: json['id'],
      name: json['name'],
    );
  }
}

const equipmentGroups = {
  'other': 'Другое',
  'constant': 'Постоянный свет',
  'impulse': 'Импульсный свет',
};

class FilterRequest {
  final List<String> equipments;
  final List<String> interiors;
  final List<String> characteristics;
  final List<String> facilities;
  final int? priceFrom;
  final int? priceTo;
  String? cityId;
  String? text;
  final List<String> metros;

  FilterRequest(
    this.equipments,
    this.interiors,
    this.characteristics,
    this.facilities,
    this.priceFrom,
    this.priceTo,
    this.cityId,
    this.text,
    this.metros,
  );

  FilterRequest.values({
    this.cityId,
    this.equipments = const [],
    this.interiors = const [],
    this.characteristics = const [],
    this.facilities = const [],
    this.priceFrom,
    this.priceTo,
    this.text,
    this.metros = const [],
  });
}

enum FilterType {
  studio,
  room,
}

class FacilityItem {
  final String id;
  final String name;

  FacilityItem({
    required this.id,
    required this.name,
  });

  factory FacilityItem.fromJson(Map<String, dynamic> json) {
    return FacilityItem(
      id: json['id'],
      name: json['name'],
    );
  }
}
