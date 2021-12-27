import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/widget/filters/characteristic_filter_list.dart';
import 'package:studion_mobile/widget/filters/filter_type_header.dart';

void showCharacteristicFiltersScreen(BuildContext context) async {
  final provider = Provider.of<FiltersProvider>(context, listen: false);
  showCupertinoModalBottomSheet(
    context: context,
    topRadius: const Radius.circular(35),
    expand: true,
    builder: (ctx) {
      return Scaffold(
        body: Column(
          children: [
            FilterTypeHeader(
              'Характеристики',
              () {
                provider.discardCharacteristics();
              },
            ),
            const SizedBox(height: 24),
            CharacteristicFilterList(),
          ],
        ),
      );
    },
  );
}
