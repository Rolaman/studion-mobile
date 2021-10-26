import 'package:flutter/material.dart';
import 'package:studion_mobile/widget/filters/filters.dart';

class RoomFiltersScreen extends StatelessWidget {
  static const routeName = '/room/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтры'),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: ListView(
          children: const [
            EquipmentFilterItem(),
            InteriorFilterItem(),
            CharacteristicsFilterItem(),
          ],
        ),
      ),
    );
  }
}
