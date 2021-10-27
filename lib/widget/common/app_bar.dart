import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/provider/search_text_type_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/screen/filters_screen.dart';
import 'package:studion_mobile/screen/list_screen.dart';
import 'package:studion_mobile/widget/common/city_selector.dart';

Widget searchAppBar() {
  return SliverAppBar(
    key: const Key('sliverAppBar'),
    toolbarHeight: 28,
    snap: true,
    floating: true,
    pinned: true,
    title: Center(child: CitySelector()),
    // actions: [
    //   SearchAction(),
    // ],
    bottom: AppBar(
      automaticallyImplyLeading: false,
      title: SearchFilters(),
    ),
  );
}

class SearchAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: const Icon(Icons.search),
    );
  }
}

class SearchFilters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchTextTypeProvider = Provider.of<SearchTextTypeProvider>(context);
    if (searchTextTypeProvider.searchText) {
      return Container(
        alignment: AlignmentDirectional.topStart,
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (_) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(ListScreen.routeName, (r) => false,
                    arguments: FilterRequest.values(
                      type: FilterType.room,
                      text: searchTextTypeProvider.textController.value.text,
                    ));
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                searchTextTypeProvider.change(false);
                searchTextTypeProvider.textController.clear();
                final itemProvider =
                    Provider.of<FiltersProvider>(context, listen: false);
                final priceProvider =
                    Provider.of<PriceFilterProvider>(context, listen: false);
                final searchTypeProvider =
                    Provider.of<SearchTypeProvider>(context, listen: false);
                final cityProvider =
                    Provider.of<CityProvider>(context, listen: false);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ListScreen.routeName, (r) => false,
                    arguments: FilterRequest(
                      itemProvider.getEquipmentFilterIds(),
                      itemProvider.getInteriorFilterIds(),
                      itemProvider.getCharacteristicFilterIds(),
                      int.tryParse(
                          priceProvider.priceFromController.value.text),
                      int.tryParse(priceProvider.priceToController.value.text),
                      cityProvider.getCurrentSync()?.id,
                      null,
                      searchTypeProvider.getCurrent(),
                    ));
              },
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    ListScreen.routeName, (r) => false,
                    arguments: FilterRequest.values(
                      type: FilterType.room,
                      text: searchTextTypeProvider.textController.value.text,
                    ));
              },
            ),
          ),
          controller: searchTextTypeProvider.textController,
          keyboardType: TextInputType.text,
        ),
      );
    }
    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<SearchTypeProvider>(
            builder: (ctx, provider, child) {
              return Container(
                alignment: AlignmentDirectional.center,
                width: 184,
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        child: const Text(
                          'Залы',
                          textAlign: TextAlign.center,
                        ),
                        decoration: provider.getCurrent() == FilterType.room
                            ? BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(25),
                              )
                            : null,
                        height: 28,
                        width: 85,
                        margin: const EdgeInsets.only(left: 2),
                      ),
                      onTap: () {
                        provider.change(FilterType.room);
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        child: const Text(
                          'Студии',
                          textAlign: TextAlign.center,
                        ),
                        decoration: provider.getCurrent() == FilterType.studio
                            ? BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(25),
                              )
                            : null,
                        height: 28,
                        width: 90,
                        margin: const EdgeInsets.only(right: 2),
                      ),
                      onTap: () {
                        provider.change(FilterType.studio);
                      },
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(25),
                ),
              );
            },
          ),
          Row(
            children: [
              GestureDetector(
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(Icons.search),
                ),
                onTap: () {
                  searchTextTypeProvider.change(true);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(Icons.filter_list_outlined),
                ),
                onTap: () {
                  showRoomFilters(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

void showRoomFilters(BuildContext context) {
  Navigator.of(context).pushNamed(FiltersScreen.routeName);
}

void showStudioFilters(BuildContext context) {
  Navigator.of(context).pushNamed('/studio/filters');
}
