import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/model/filters_dto.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
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

    List<Widget> itemList = [];

    if (typeProvider.getCurrent() == FilterType.room) {
      final rooms = Provider.of<RoomListProvider>(context).items;
      itemList = rooms.map((e) => RoomListCard(e, Key(e.id))).toList();
    } else {
      final studios = Provider.of<StudioListProvider>(context).items;
      itemList = studios.map((e) => StudioListCard(e, Key(e.id))).toList();
    }

    return Scaffold(
      body: SafeArea(
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
      bottomNavigationBar: NavigationBar(),
    );
  }
}
