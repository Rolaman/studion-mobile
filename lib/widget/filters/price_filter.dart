import 'package:flutter/widgets.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';
import 'package:studion_mobile/widget/common/text/small_separate_comment.dart';
import 'package:studion_mobile/widget/filters/price_filter_current.dart';
import 'package:studion_mobile/widget/filters/price_filter_slider.dart';

class PriceFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RegularSeparateTitle('Ценовой диапазон'),
          const SizedBox(height: 12),
          const SmallSeparateComment('Выберите необходимый диапазон'),
          const SizedBox(height: 12),
          PriceFilterCurrent(),
          PriceFilterSlider(),
        ],
      ),
    );
  }
}
