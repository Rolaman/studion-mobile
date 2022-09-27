import 'city_dto.dart';
import 'filters_dto.dart';
import 'metro_dto.dart';

class AppConfig {
  final List<CharacteristicItem> characteristics;
  final List<EquipmentItem> equipments;
  final List<FacilityItem> facilities;
  final List<InteriorItem> interiors;
  final List<CityItem> cities;

  AppConfig({
    required this.characteristics,
    required this.equipments,
    required this.facilities,
    required this.interiors,
    required this.cities,
  });

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    final characteristics =
        (json["characteristics"] as List<dynamic>)
            .map((e) => CharacteristicItem.fromJson(e))
            .toList();
    final equipments = (json["equipments"] as List<dynamic>)
        .map((e) => EquipmentItem.fromJson(e))
        .toList();
    final facilities = (json["facilities"] as List<dynamic>)
        .map((e) => FacilityItem.fromJson(e))
        .toList();
    final interiors = (json["interiors"] as List<dynamic>)
        .map((e) => InteriorItem.fromJson(e))
        .toList();
    final cities = (json["cities"] as List<dynamic>)
        .map((e) => CityItem.fromJson(e))
        .toList();
    return AppConfig(
        characteristics: characteristics,
        equipments: equipments,
        facilities: facilities,
        interiors: interiors,
        cities: cities);
  }
}
