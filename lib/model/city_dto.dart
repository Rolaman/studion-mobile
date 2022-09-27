class CityItem {
  final String id;
  final String name;

  CityItem({
    required this.id,
    required this.name,
  });

  factory CityItem.fromJson(Map<String, dynamic> json) {
    return CityItem(
      id: json['id'],
      name: json['name'],
    );
  }
}
