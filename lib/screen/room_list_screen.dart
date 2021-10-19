import 'package:flutter/material.dart';
import 'package:studion_mobile/widget/common/room_app_bar.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/room/room_card_list.dart';

class RoomListScreen extends StatelessWidget {
  static const routeName = '/rooms';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoomCardList(),
      bottomNavigationBar: NavigationBar(),
      appBar: roomAppBar(),
    );
  }
}
