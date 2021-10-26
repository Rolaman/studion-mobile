import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/widget/filters/equipment_filters_modal.dart';

class EquipmentFilterItem extends StatelessWidget {

  const EquipmentFilterItem() : super(key: const Key('equipment'));

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersProvider>(
      builder: (ctx, FiltersProvider provider, Widget? child) {
        return Column(
          children: [
            child!,
            Row(
              children: provider.getEquipmentFilters().map((e) {
                return Container(
                  child: Text(e),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
      child: GestureDetector(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const Text(
                  'Оборудование',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        onTap: () {
          showMaterialModalBottomSheet(context: context, builder: (ctx) {
            return EquipmentFiltersModal();
          });
        },
      ),
    );;
  }
}
