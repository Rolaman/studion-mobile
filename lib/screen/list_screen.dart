import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/city_dto.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/model/room_dto.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/loader.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/common/studio_app_bar.dart';
import 'package:studion_mobile/widget/room/room_card.dart';
import 'package:studion_mobile/widget/studio/studio_card.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/list';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as FilterRequest? ??
        FilterRequest.values(
          type: FilterType.room,
        );
    return FutureBuilder(
      future: Provider.of<CityProvider>(context, listen: false).getCurrent(),
      builder: (ctx2, AsyncSnapshot<CityItem> citySnapshot) {
        if (citySnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                searchAppBar(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 500,
                    child: Center(
                      child: Loader(),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: NavigationBar(),
          );
        }
        args.cityId = citySnapshot.data!.id;

        return Consumer<SearchTypeProvider>(
            child: searchAppBar(),
            builder: (_, searchTypeProvider, ch) {
              if (searchTypeProvider.getCurrent() == FilterType.room) {
                final roomProvider =
                    Provider.of<RoomListProvider>(context, listen: false);
                return FutureBuilder(
                    future: roomProvider.get(args),
                    builder: (ctx, AsyncSnapshot<List<RoomItem>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Scaffold(
                          body: CustomScrollView(
                            slivers: [
                              ch ?? searchAppBar(),
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 500,
                                  child: Center(
                                    child: Loader(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          bottomNavigationBar: NavigationBar(),
                        );
                      }
                      return Scaffold(
                        body: CustomScrollView(
                          slivers: [
                            ch ?? searchAppBar(),
                            SliverList(
                                delegate: SliverChildListDelegate(snapshot.data!
                                    .map((e) => RoomCard(e, Key(e.name)))
                                    .toList())),
                          ],
                        ),
                        bottomNavigationBar: NavigationBar(),
                      );
                    });
              }
              return Consumer<StudioListProvider>(builder: (_, provider, ch) {
                return FutureBuilder(
                    future: provider.get(args),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Scaffold(
                          body: CustomScrollView(
                            slivers: [
                              ch ?? searchAppBar(),
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 500,
                                  child: Center(
                                    child: Loader(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          bottomNavigationBar: NavigationBar(),
                        );
                      }
                      return Scaffold(
                        body: CustomScrollView(
                          slivers: [
                            ch ?? searchAppBar(),
                            SliverList(
                                delegate: SliverChildListDelegate(provider.items
                                    .map((e) => StudioCard(e, Key(e.name)))
                                    .toList())),
                          ],
                        ),
                        bottomNavigationBar: NavigationBar(),
                      );
                    });
              });
            });
      },
    );
  }
}
