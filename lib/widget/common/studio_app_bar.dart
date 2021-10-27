import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/room_filters_screen.dart';
import 'package:studion_mobile/widget/common/city_selector.dart';

Widget searchAppBar() {
  return SliverAppBar(
    key: Key('sliverAppBar'),
    snap: true,
    floating: true,
    pinned: true,
    title: Row(
      children: [
        CitySelector(),
      ],
    ),
    actions: [
      SearchAction(),
    ],
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
    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: const EdgeInsets.only(
        left: 20,
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
    );
  }
}

AppBar studioAppBar() {
  return AppBar(
    title: Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: StudioSearchField(),
      ),
    ),
  );
}

class StudioSearchField extends StatefulWidget {
  @override
  _StudioSearchFieldState createState() => _StudioSearchFieldState();
}

class _StudioSearchFieldState extends State<StudioSearchField> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (text) {
        Provider.of<StudioListProvider>(context, listen: false)
            .get(FilterRequest.values(
          type: FilterType.studio,
          text: text,
        ));
      },
      textInputAction: TextInputAction.search,
      controller: textController,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<StudioListProvider>(context, listen: false)
                  .get(FilterRequest.values(
                type: FilterType.studio,
              ));
              textController.clear();
            },
          ),
          hintText: 'Поиск'),
    );
  }
}

void showRoomFilters(BuildContext context) {
  Navigator.of(context).pushNamed(RoomFiltersScreen.routeName);
}

void showStudioFilters(BuildContext context) {
  Navigator.of(context).pushNamed('/studio/filters');
}
