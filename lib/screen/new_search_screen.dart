import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/search_text_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/common/text/small_separate_title.dart';
import 'package:studion_mobile/widget/room/room_list_card.dart';
import 'package:studion_mobile/widget/search/search_app_bar.dart';
import 'package:studion_mobile/widget/studio/studio_list_card.dart';

class NewSearchScreen extends StatelessWidget {
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    final typeProvider = Provider.of<SearchTypeProvider>(context);
    final provider = Provider.of<StarredProvider>(context, listen: false);

    final request = buildFilterRequest(context);

    List<Widget> itemList = [];

    if (typeProvider.getCurrent() == FilterType.room) {
      final rooms =
          Provider.of<RoomListProvider>(context).byRequest(request);
      itemList = rooms
          .map((e) => RoomListCard(
                e,
                provider.roomIds.contains(e.id),
                Key(e.id),
              ))
          .toList();
    } else {
      final studios =
          Provider.of<StudioListProvider>(context).byRequest(request);
      itemList = studios
          .map((e) => StudioListCard(
                e,
                provider.studioIds.contains(e.id),
                Key(e.id),
              ))
          .toList();
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              searchAppBar(context),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 12,
                    ),
                    SideMarginDecorator(
                        SmallSeparateTitle('${itemList.length} залов')),
                    const SizedBox(
                      height: 12,
                    ),
                    ...itemList.map((e) => SideMarginDecorator(e)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonNavigationBar(),
    );
  }
}

FilterRequest buildFilterRequest(BuildContext context) {
  final filterItemsProvider = Provider.of<FiltersProvider>(context);
  final priceProvider = Provider.of<PriceFilterProvider>(context);
  final textProvider = Provider.of<SearchTextProvider>(context);
  return FilterRequest.values(
    // TODO remove moscow hardcode
    cityId: "moscow",
    equipments: filterItemsProvider.getEquipmentFilterIds(),
    interiors: filterItemsProvider.getInteriorFilterIds(),
    characteristics: filterItemsProvider.getCharacteristicFilterIds(),
    facilities: filterItemsProvider.getFacilitiesFilterIds(),
    priceFrom: priceProvider.values.start.toInt(),
    priceTo: priceProvider.values.end.toInt(),
    text: textProvider.textController.text,
  );
}
