import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:studion_mobile/widget/filters/back_header.dart';

void showCharacteristicFiltersScreen(BuildContext context) async {
  showCupertinoModalBottomSheet(
    context: context,
    topRadius: const Radius.circular(35),
    expand: true,
    builder: (ctx) {
      return Scaffold(
        body: Column(
          children: [
            BackHeader(),
            const SizedBox(height: 24),
            Text('TEST'),
          ],
        ),
      );
    },
  );
}
