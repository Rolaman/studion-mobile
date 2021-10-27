import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/screen/list_screen.dart';
import 'package:studion_mobile/widget/filters/filters.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтры'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: GestureDetector(
                child: const Text('Сбросить'),
                onTap: () {
                  Provider.of<FiltersProvider>(context, listen: false)
                      .discard();
                  final city = Provider.of<CityProvider>(context, listen: false)
                      .getCurrentSync();
                  Provider.of<RoomListProvider>(context, listen: false)
                      .changeFilters(FilterRequest.values(
                          type: FilterType.room, cityId: city?.id));
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      ListScreen.routeName, (r) => false);
                },
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Stack(
          children: [
            ListView(
              children: const [
                EquipmentFilterItem(),
                InteriorFilterItem(),
                CharacteristicsFilterItem(),
                PriceFilterItem(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 30,
              ),
              alignment: AlignmentDirectional.bottomCenter,
              child: CupertinoButton(
                color: Colors.indigo,
                child: const Text('Применить'),
                onPressed: () {
                  final itemProvider =
                      Provider.of<FiltersProvider>(context, listen: false);
                  final cityProvider =
                      Provider.of<CityProvider>(context, listen: false);
                  final priceProvider =
                      Provider.of<PriceFilterProvider>(context, listen: false);
                  Provider.of<RoomListProvider>(context, listen: false)
                      .changeFilters(FilterRequest(
                    itemProvider.getEquipmentFilterIds(),
                    itemProvider.getInteriorFilterIds(),
                    itemProvider.getCharacteristicFilterIds(),
                    int.tryParse(priceProvider.priceFromController.value.text),
                    int.tryParse(priceProvider.priceToController.value.text),
                    cityProvider.getCurrentSync()?.id,
                    null,
                    FilterType.room,
                  ));
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      ListScreen.routeName, (r) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
