import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/city_dto.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';

class CitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cityProvider = Provider.of<CityProvider>(context, listen: true);
    final current = cityProvider.getCurrentSync();
    return InkWell(
      child: Container(
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(current.name),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
      onTap: () async {
        final cities =
            await Provider.of<CityProvider>(context, listen: false).getAll();
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Container(
              height: 200,
              child: Column(
                children: [
                  ...cities.map((e) {
                    return InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Text(
                          e.name,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: () {
                        Provider.of<CityProvider>(context, listen: false)
                            .change(e.id);
                        Provider.of<RoomListProvider>(context, listen: false)
                            .changeFilters(FilterRequest.values(
                                type: FilterType.room, cityId: e.id));
                        Provider.of<StudioListProvider>(context, listen: false)
                            .changeFilters(FilterRequest.values(
                            type: FilterType.studio, cityId: e.id));
                        Navigator.of(context).pop();
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
