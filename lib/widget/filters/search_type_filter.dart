import 'package:flutter/widgets.dart';
import 'package:studion_mobile/widget/filters/search_type_filter_item_list.dart';
import 'package:studion_mobile/widget/common/text/regular_separate_title.dart';

class SearchTypeFilter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RegularSeparateTitle('Тип поиска'),
        const SizedBox(height: 12),
        SearchTypeFilterItemList(),
      ],
    );
  }
}
