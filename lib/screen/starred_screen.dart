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
        bottomNavigationBar: CommonNavigationBar(),
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
    final provider = Provider.of<StarredProvider>(context, listen: false);
    final studios = provider.studioIds;
    final studioProvider =
        Provider.of<StudioListProvider>(context, listen: false);
    if (studios.isEmpty) {
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
        ...studios.map((e) {
          return StudioCard(studioProvider.getOne(e), Key(e));
        }).toList()
      ],
    );
  }
}

class StarredRoomTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StarredProvider>(context, listen: false);
    final rooms = provider.roomIds;
    final roomProvider = Provider.of<RoomListProvider>(context, listen: false);

    if (rooms.isEmpty) {
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
        ...rooms.map((e) {
          return RoomCard(roomProvider.getOne(e), Key(e));
        }).toList()
      ],
    );
  }
}
