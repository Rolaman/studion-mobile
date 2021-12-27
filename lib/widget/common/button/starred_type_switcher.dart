import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/starred_type_provider.dart';
import 'package:studion_mobile/util/theme.dart';

class StarredTypeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredTypeProvider>(context);

    return Container(
      width: 160,
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          FilterTypeSwitchItem(
            name: 'Залы',
            type: FilterType.room,
            enabled: provider.getCurrent() == FilterType.room,
          ),
          const SizedBox(
            width: 25,
          ),
          FilterTypeSwitchItem(
            name: 'Студии',
            type: FilterType.studio,
            enabled: provider.getCurrent() == FilterType.studio,
          ),
        ],
      ),
    );
  }
}

class FilterTypeSwitchItem extends StatelessWidget {
  final String name;
  final FilterType type;
  final bool enabled;

  const FilterTypeSwitchItem({
    required this.name,
    required this.type,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredTypeProvider>(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: 40,
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: enabled ? mainColor : Colors.black,
              ),
            ),
            enabled
                ? Container(
                    margin: const EdgeInsets.only(
                      top: 3,
                    ),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      onTap: () {
        provider.change(type);
      },
    );
  }
}
