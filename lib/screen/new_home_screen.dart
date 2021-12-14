import 'package:flutter/material.dart';
import 'package:studion_mobile/widget/best/best_room_list.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/popular/popular_studio_list.dart';
import 'package:studion_mobile/widget/common/text/screen_header.dart';

class NewHomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const ScreenHeader('Обзор'),
              PopularStudioList(),
              const BestRoomList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonNavigationBar(),
    );
  }
}
