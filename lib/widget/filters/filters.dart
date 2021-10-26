import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/widget/filters/characteristics_filter_modal.dart';
import 'package:studion_mobile/widget/filters/equipment_filters_modal.dart';
import 'package:studion_mobile/widget/filters/interior_filters_modal.dart';

class EquipmentFilterItem extends StatelessWidget {
  const EquipmentFilterItem() : super(key: const Key('equipment'));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Consumer<FiltersProvider>(
        builder: (ctx, FiltersProvider provider, Widget? child) {
          return Column(
            children: [
              child!,
              Row(
                children: provider.getEquipmentFilters().map((e) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 1,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2,
                    ),
                    child: Text(e),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Оборудование',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      onTap: () {
        showMaterialModalBottomSheet(
            context: context,
            builder: (ctx) {
              return EquipmentFiltersModal();
            });
      },
    );
  }
}

class InteriorFilterItem extends StatelessWidget {
  const InteriorFilterItem() : super(key: const Key('interior'));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Consumer<FiltersProvider>(
        builder: (ctx, FiltersProvider provider, Widget? child) {
          return Column(
            children: [
              child!,
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  children: provider.getInteriorFilters().map((e) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 1,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      child: Text(e),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Интерьер',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      onTap: () {
        showMaterialModalBottomSheet(
            context: context,
            builder: (ctx) {
              return InteriorFiltersModal();
            });
      },
    );
  }
}

class CharacteristicsFilterItem extends StatelessWidget {
  const CharacteristicsFilterItem() : super(key: const Key('characteristics'));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Consumer<FiltersProvider>(
        builder: (ctx, FiltersProvider provider, Widget? child) {
          return Column(
            children: [
              child!,
              Container(
                alignment: AlignmentDirectional.topStart,
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  children: provider.getCharacteristicFilters().map((e) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 1,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      child: Text(e),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Характеристики',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      onTap: () {
        showMaterialModalBottomSheet(
            context: context,
            builder: (ctx) {
              return CharacteristicsFiltersModal();
            });
      },
    );
  }
}
