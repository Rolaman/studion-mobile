import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/provider/starred_type_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/room/room_starred_list_card.dart';
import 'package:studion_mobile/widget/search/starred_app_bar.dart';
import 'package:studion_mobile/widget/studio/studio_list_card.dart';
import 'package:studion_mobile/widget/studio/studio_starred_list_card.dart';

class NewStarredScreen extends StatelessWidget {
  static const routeName = '/starred';

  @override
  Widget build(BuildContext context) {
    final typeProvider = Provider.of<StarredTypeProvider>(context);
    final provider = Provider.of<StarredProvider>(context);

    List<Widget> itemList = [];

    if (typeProvider.getCurrent() == FilterType.room) {
      final rooms = Provider.of<RoomListProvider>(context).items;
      itemList = rooms
          .where((e) => provider.roomIds.contains(e.id))
          .map((e) => RoomStarredListCard(
                e,
                provider.roomIds.contains(e.id),
                Key(e.id),
              ))
          .toList();
    } else {
      final studios = Provider.of<StudioListProvider>(context).items;
      itemList = studios
          .where((e) => provider.studioIds.contains(e.id))
          .map((e) => StudioStarredListCard(
                e,
                provider.studioIds.contains(e.id),
                Key(e.id),
              ))
          .toList();
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            starredAppBar(context),
            SliverList(
              delegate: SliverChildListDelegate(
                [
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
      bottomNavigationBar: CommonNavigationBar(),
    );
  }
}
