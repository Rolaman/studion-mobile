import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studion_mobile/screen/characteristic_filter_modal_screen.dart';
import 'package:studion_mobile/screen/equipment_filter_modal_screen.dart';
import 'package:studion_mobile/screen/facility_filter_modal_screen.dart';
import 'package:studion_mobile/screen/interior_filter_modal_screen.dart';
import 'package:studion_mobile/widget/filters/city_filter.dart';
import 'package:studion_mobile/widget/filters/main_filter_item.dart';
import 'package:studion_mobile/widget/filters/price_filter.dart';
import 'package:studion_mobile/widget/filters/search_type_filter.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';

class FilterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SideMarginDecorator(
      Column(
        children: [
          SearchTypeFilter(),
          const SizedBox(height: 20),
          const Divider(color: commonGrey),
          const SizedBox(height: 20),
          PriceFilter(),
          const SizedBox(height: 20),
          const Divider(color: commonGrey),
          const SizedBox(height: 20),
          const MainFilterItem('Оборудование', showEquipmentFiltersScreen),
          const SizedBox(height: 30),
          const MainFilterItem('Интерьеры', showInteriorFiltersScreen),
          const SizedBox(height: 30),
          const MainFilterItem(
              'Характеристики', showCharacteristicFiltersScreen),
          const SizedBox(height: 30),
          const MainFilterItem('Удобства', showFacilityFiltersScreen),
          const SizedBox(height: 20),
          const Divider(color: commonGrey),
          const SizedBox(height: 20),
          CityFilter(),
        ],
      ),
      margin: 24,
    );
  }
}
