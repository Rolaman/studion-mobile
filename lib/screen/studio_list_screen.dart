import 'package:flutter/material.dart';
import 'package:studion_mobile/widget/common/studio_app_bar.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/studio/studio_card_list.dart';

class StudioListScreen extends StatelessWidget {
  static const routeName = '/studios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          searchAppBar(),
          // StudioCardList(),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
