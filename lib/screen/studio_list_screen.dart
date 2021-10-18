import 'package:flutter/material.dart';
import 'package:studion_mobile/widget/common/app_bar.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';
import 'package:studion_mobile/widget/studio/studio_card_list.dart';

class StudioListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudioCardList(),
      bottomNavigationBar: NavigationBar(),
      appBar: studioAppBar(),
    );
  }
}
