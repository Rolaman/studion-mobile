import 'package:flutter/widgets.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';
import 'package:studion_mobile/widget/filters/city_filter_item_list.dart';

class CityFilter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RegularSeparateTitle('Город'),
          const SizedBox(height: 12),
          CityFilterItemList(),
        ],
      ),
    );
  }
}
