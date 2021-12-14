import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

class CityFilterItemList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);
    final currentCity = provider.getCurrentSync();
    return Row(
      children: [
        ...provider.items.map((e) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: CityFilterItem(
              id: e.id,
              name: e.name,
              enable: e.id == currentCity.id,
            ),
          );
        })
      ],
    );
  }
}

class CityFilterItem extends StatelessWidget {
  final String id;
  final String name;
  final bool enable;

  const CityFilterItem({
    required this.id,
    required this.name,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CityProvider>(context);
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
        provider.change(id);
      },
    );
  }
}
