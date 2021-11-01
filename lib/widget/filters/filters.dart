import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/widget/filters/characteristics_filter_modal.dart';
import 'package:studion_mobile/widget/filters/equipment_filters_modal.dart';
import 'package:studion_mobile/widget/filters/facilities_filters_modal.dart';
import 'package:studion_mobile/widget/filters/interior_filters_modal.dart';
import 'package:studion_mobile/widget/filters/metro_filter_modal.dart';

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
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(left: 3),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  children: provider.getEquipmentFilters().map((e) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 1,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      child: !e.id.contains('-any')
                          ? Text(e.name)
                          : Text(
                              '${e.name} ${equipmentGroups[e.type]!.toLowerCase()}'),
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
                margin: const EdgeInsets.only(left: 3),
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
                margin: const EdgeInsets.only(left: 3),
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

class PriceFilterItem extends StatefulWidget {
  const PriceFilterItem() : super(key: const Key('price'));

  @override
  State<PriceFilterItem> createState() => _PriceFilterItemState();
}

class _PriceFilterItemState extends State<PriceFilterItem> {
  late FocusNode focusNodeFrom;
  late FocusNode focusNodeTo;

  @override
  void initState() {
    super.initState();
    focusNodeFrom = FocusNode();
    focusNodeTo = FocusNode();
  }

  @override
  void dispose() {
    focusNodeFrom.dispose();
    focusNodeTo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PriceFilterProvider>(context, listen: false);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 8.0,
              ),
              child: Text(
                'Цена, руб.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    child: TextField(
                      focusNode: focusNodeFrom,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      controller: provider.priceFromController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'От',
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    child: TextField(
                      focusNode: focusNodeTo,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      controller: provider.priceToController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'До',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
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

class MetroFilterItem extends StatelessWidget {
  const MetroFilterItem() : super(key: const Key('metros'));

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
                margin: const EdgeInsets.only(left: 3),
                alignment: AlignmentDirectional.topStart,
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  children: provider.getMetroFilters().map((e) {
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
                'Станции метро',
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
              return MetroFiltersModal();
            });
      },
    );
  }
}

class FacilityFilterItem extends StatelessWidget {
  const FacilityFilterItem() : super(key: const Key('facility'));

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
                margin: const EdgeInsets.only(left: 3),
                alignment: AlignmentDirectional.topStart,
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  children: provider.getFacilitiesFilters().map((e) {
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
                'Удобства',
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
              return FacilitiesFiltersModal();
            });
      },
    );
  }
}
