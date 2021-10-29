class EquipmentItem {
  final String id;
  final String name;
  final String type;
  final String? imageUrl;

  EquipmentItem({
    required this.id,
    required this.name,
    required this.type,
    this.imageUrl,
  });
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

  InteriorItem(this.id, this.name);
}

class CharacteristicItem {
  final String id;
  final String name;

  CharacteristicItem(this.id, this.name);
}

const equipmentGroups = {
  'generator': 'Генераторный свет',
  'others': 'Остальное',
};

class FilterRequest {
  final List<String> equipments;
  final List<String> interiors;
  final List<String> characteristics;
  final int? priceFrom;
  final int? priceTo;
  String? cityId;
  String? text;
  FilterType type;
  final List<String> metros;

  FilterRequest(
    this.equipments,
    this.interiors,
    this.characteristics,
    this.priceFrom,
    this.priceTo,
    this.cityId,
    this.text,
    this.type,
    this.metros,
  );

  FilterRequest.values({
    this.cityId,
    this.equipments = const [],
    this.interiors = const [],
    this.characteristics = const [],
    this.priceFrom,
    this.priceTo,
    this.text,
    required this.type,
    this.metros = const [],
  });
}

enum FilterType {
  studio,
  room,
}
