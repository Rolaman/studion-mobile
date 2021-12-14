import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:studion_mobile/widget/filters/filter_list.dart';
import 'package:studion_mobile/widget/filters/filters_header.dart';

void showFiltersScreen(BuildContext context) async {
  showCupertinoModalBottomSheet(
    context: context,
    topRadius: const Radius.circular(35),
    expand: true,
    builder: (ctx) {
      return Scaffold(
        body: Column(
          children: [
            FiltersHeader(),
            const SizedBox(height: 24),
            FilterList(),
          ],
        ),
      );
    },
  );
}
