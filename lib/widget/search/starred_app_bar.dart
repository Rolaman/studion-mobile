import 'package:flutter/material.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/starred_type_switcher.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';
import 'package:studion_mobile/widget/common/text/screen_header.dart';

SliverAppBar starredAppBar(BuildContext context) {
  return SliverAppBar(
    key: const Key('sliverAppBar'),
    toolbarHeight: 70,
    snap: true,
    floating: true,
    pinned: true,
    elevation: 0,
    title: Container(
      alignment: AlignmentDirectional.topStart,
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: const ScreenHeader(
        'Избранное',
        leftMargin: 14,
      ),
    ),
    backgroundColor: backgroundColor,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(45),
      child: Container(
        alignment: AlignmentDirectional.topStart,
        margin: const EdgeInsets.only(right: 10),
        child: SideMarginDecorator(StarredTypeSwitcher()),
      ),
    ),
  );
}
