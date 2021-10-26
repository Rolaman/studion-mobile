class EquipmentItem {
  final String id;
  final String name;
  final String type;

  EquipmentItem(this.id, this.name, this.type);
}

class EquipmentGroup {
  final String id;
  final String name;
  final List<EquipmentItem> items;

  EquipmentGroup(this.id, this.name, this.items);
}

const equipmentGroups = {
  'generator': 'Генераторный свет',
  'others': 'Остальное',
};