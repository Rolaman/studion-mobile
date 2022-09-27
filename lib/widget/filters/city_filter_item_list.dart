import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/city_dto.dart';
import 'package:studion_mobile/provider/app_config_provider.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';

import '../../provider/current_city_provider.dart';

class CityFilterItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context, listen: false);
    final currentCityProvider = Provider.of<CurrentCityProvider>(context);
    final currentCity = currentCityProvider.currentCity;
    return Row(
      children: [
        ...provider.config.cities.map((e) {
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
    final provider = Provider.of<CurrentCityProvider>(context);
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
        provider.change(CityItem(
          id: id,
          name: name,
        ));
      },
    );
  }
}
