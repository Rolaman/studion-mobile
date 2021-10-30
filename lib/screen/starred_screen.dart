import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/loader.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/room/room_card.dart';
import 'package:studion_mobile/widget/studio/studio_card.dart';

class StarredScreen extends StatelessWidget {
  static const routeName = '/starred';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(),
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(tabs: [
                Tab(
                  icon: Text(
                    'Студии',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Tab(
                  icon: Text(
                    'Залы',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ]),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StarredStudioTabView(),
            StarredRoomTabView(),
          ],
        ),
      ),
      length: 2,
    );
  }
}

class StarredStudioTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StarredProvider>(builder: (ctx, provider, _) {
      return FutureBuilder(
          future: provider.getStarredStudios(),
          builder: (ctx, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loader();
            }
            final studioProvider =
                Provider.of<StudioListProvider>(context, listen: false);
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Нет избранных студий',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              );
            }
            return ListView(
              children: [
                ...snapshot.data!.map((e) {
                  return StudioCard(studioProvider.getOne(e), Key(e));
                }).toList()
              ],
            );
          });
    });
  }
}

class StarredRoomTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StarredProvider>(builder: (ctx, provider, _) {
      return FutureBuilder(
          future: provider.getStarredRooms(),
          builder: (ctx, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loader();
            }
            final roomProvider =
                Provider.of<RoomListProvider>(context, listen: false);
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'Нет избранных залов',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              );
            }
            return ListView(
              children: [
                ...snapshot.data!.map((e) {
                  return RoomCard(roomProvider.getOne(e), Key(e));
                }).toList()
              ],
            );
          });
    });
  }
}
