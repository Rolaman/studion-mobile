import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/search_text_type_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/city_selector.dart';

Widget searchAppBar() {
  return SliverAppBar(
    key: const Key('sliverAppBar'),
    toolbarHeight: 28,
    snap: true,
    floating: true,
    pinned: true,
    title: Center(child: CitySelector()),
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
          style: const TextStyle(
            fontSize: 20,
          ),
          textAlignVertical: TextAlignVertical.center,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => doSearchByText(context, searchTextTypeProvider),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 2,
              bottom: 2,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () =>
                  closeSearchByText(context, searchTextTypeProvider),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => doSearchByText(context, searchTextTypeProvider),
            ),
          ),
          controller: searchTextTypeProvider.textController,
        ),
      );
    }
    final activeFilters =
        Provider.of<FiltersProvider>(context).hasActiveFilters();
    final activePriceFilters =
        Provider.of<PriceFilterProvider>(context).hasActiveFilters();

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
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Icon(Icons.filter_list_outlined),
                      activeFilters || activePriceFilters
                          ? Container(
                              alignment: AlignmentDirectional.topEnd,
                              child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                onTap: () {
                  showFilters(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

void showFilters(BuildContext context) {
}

void closeSearchByText(BuildContext context, SearchTextTypeProvider provider) {
  provider.change(false);
  provider.textController.clear();
  final itemProvider = Provider.of<FiltersProvider>(context, listen: false);
  final priceProvider =
      Provider.of<PriceFilterProvider>(context, listen: false);
  final cityProvider = Provider.of<CityProvider>(context, listen: false);
  itemProvider.discard();
  priceProvider.priceFromController.clear();
  priceProvider.priceToController.clear();
  Provider.of<RoomListProvider>(context, listen: false).changeFilters(
      FilterRequest.values(
          type: FilterType.room, cityId: cityProvider.getCurrentSync().id));
  Provider.of<StudioListProvider>(context, listen: false).changeFilters(
      FilterRequest.values(
          type: FilterType.studio, cityId: cityProvider.getCurrentSync().id));
}

void doSearchByText(BuildContext context, SearchTextTypeProvider provider) {
  final cityProvider = Provider.of<CityProvider>(context, listen: false);
  final itemProvider = Provider.of<FiltersProvider>(context, listen: false);
  final priceProvider =
      Provider.of<PriceFilterProvider>(context, listen: false);
  itemProvider.discard();
  priceProvider.priceFromController.clear();
  priceProvider.priceToController.clear();
  Provider.of<RoomListProvider>(context, listen: false).changeFilters(
      FilterRequest.values(
          type: FilterType.room,
          text: provider.textController.value.text,
          cityId: cityProvider.getCurrentSync().id));
  Provider.of<StudioListProvider>(context, listen: false).changeFilters(
      FilterRequest.values(
          type: FilterType.studio,
          text: provider.textController.value.text,
          cityId: cityProvider.getCurrentSync().id));
}
