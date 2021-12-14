import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class SearchTypeFilterItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchTypeProvider>(context);
    return Row(
      children: [
        SearchTypeFilterItem(
          type: FilterType.room,
          name: 'Залы',
          enable: provider.getCurrent() == FilterType.room,
        ),
        const SizedBox(width: 16),
        SearchTypeFilterItem(
          type: FilterType.studio,
          name: 'Студии',
          enable: provider.getCurrent() == FilterType.studio,
        ),
      ],
    );
  }
}

class SearchTypeFilterItem extends StatelessWidget {
  final FilterType type;
  final String name;
  final bool enable;

  const SearchTypeFilterItem({
    required this.type,
    required this.name,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchTypeProvider>(context);
    final color = enable ? Colors.white : Colors.black;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: enable ? mainColor : disabledColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        child: SmallSeparateTitle(
          name,
          color: color,
        ),
      ),
      onTap: () {
        provider.change(type);
      },
    );
  }
}
