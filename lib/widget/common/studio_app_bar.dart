import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/studio_dto.dart';
import 'package:studion_mobile/provider/room_studio_selector_bar_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/room_filters_screen.dart';
import 'package:studion_mobile/widget/common/city_selector.dart';
import 'package:studion_mobile/widget/filters/equipment_filters_modal.dart';

Widget searchAppBar() {
  return SliverAppBar(
    snap: true,
    floating: true,
    pinned: true,
    title: Row(
      children: [
        CitySelector(),
        // SearchAction(),
      ],
    ),
    actions: [
      SearchAction(),
    ],
    bottom: AppBar(
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
          Consumer<RoomStudioSelectorBarProvider>(
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
                        decoration: provider.getCurrent() ==
                                RoomStudioSelectorState.room
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
                        provider.change(RoomStudioSelectorState.room);
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        child: const Text(
                          'Студии',
                          textAlign: TextAlign.center,
                        ),
                        decoration: provider.getCurrent() ==
                                RoomStudioSelectorState.studio
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
                        provider.change(RoomStudioSelectorState.studio);
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
            .get(StudioListRequest(
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
                  .get(StudioListRequest());
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
