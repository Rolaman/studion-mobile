import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class PriceFilterSlider extends StatefulWidget {
  @override
  State<PriceFilterSlider> createState() => _PriceFilterSliderState();
}

class _PriceFilterSliderState extends State<PriceFilterSlider> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PriceFilterProvider>(context);

    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(
        activeTrackColor: mainColor,
        inactiveTrackColor: commonGrey,
        activeTrackHeight: 3,
        inactiveTrackHeight: 3,
        thumbRadius: 12,
        thumbColor: mainColor,
        overlayRadius: 0,
        tooltipTextStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
      child: SfRangeSlider(
        values: provider.values,
        min: 0,
        max: 10000,
        stepSize: 100,
        onChanged: (value) {
          provider.change(value);
        },
      ),
    );
  }
}
