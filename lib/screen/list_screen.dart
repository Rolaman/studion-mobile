import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
import 'package:studion_mobile/widget/common/app_bar.dart';
import 'package:studion_mobile/widget/room/room_card.dart';
import 'package:studion_mobile/widget/studio/studio_card.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/list';

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchTypeProvider>(
        child: searchAppBar(),
        builder: (_, searchTypeProvider, ch) {
          if (searchTypeProvider.getCurrent() == FilterType.room) {
            return Consumer<RoomListProvider>(
                builder: (ctx, roomProvider, child) {
              final rooms = roomProvider
                  .getCurrents()
                  .map((e) => RoomCard(e, Key(e.name)))
                  .toList();
              if (rooms.isEmpty) {
                return Scaffold(
                  body: CustomScrollView(
                    slivers: [
                      ch ?? searchAppBar(),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        const SizedBox(
                          height: 50,
                        ),
                        const Center(
                          child: Text(
                            'Залов по запросу не найдено',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Transform.scale(
                            scale: 2,
                            child: const Icon(LineIcons.frowningFace),
                          ),
                        )
                      ])),
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
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext ctx, int index) {
                          return RoomCard(
                            roomProvider.items[index],
                            Key(roomProvider.items[index].name),
                          );
                        },
                        childCount: roomProvider.items.length,
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: NavigationBar(),
              );
            });
          }
          return Consumer<StudioListProvider>(builder: (_, provider, ch) {
            return FutureBuilder(
                future:
                    provider.get(FilterRequest.values(type: FilterType.studio)),
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
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext ctx, int index) {
                              return StudioCard(
                                provider.items[index],
                                Key(provider.items[index].name),
                              );
                            },
                            childCount: provider.items.length,
                          ),
                        ),
                      ],
                    ),
                    bottomNavigationBar: NavigationBar(),
                  );
                });
          });
        });
  }
}
