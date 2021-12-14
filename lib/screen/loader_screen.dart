import 'package:flutter/material.dart';
import 'package:studion_mobile/widget/common/loader.dart';
import 'package:studion_mobile/widget/common/navigation_bar.dart';

class LoaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loader(),
      bottomNavigationBar: CommonNavigationBar(),
    );
  }
}
