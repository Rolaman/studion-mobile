import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studion_mobile/util/theme.dart';
import 'package:studion_mobile/widget/common/button/filter_type_switcher.dart';
import 'package:studion_mobile/widget/common/button/filters_button.dart';
import 'package:studion_mobile/widget/common/decorator/side_margin_decorator.dart';
import 'package:studion_mobile/widget/common/text/screen_header.dart';
import 'package:studion_mobile/widget/search/search_input.dart';

SliverAppBar searchAppBar(BuildContext context) {
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
        'Поиск',
        leftMargin: 14,
      ),
    ),
    backgroundColor: backgroundColor,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(99),
      child: Container(
        margin: const EdgeInsets.only(
          right: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchInput(),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: FiltersButton(48),
                ),
              ],
            ),
            SideMarginDecorator(FilterTypeSwitcher()),
          ],
        ),
      ),
    ),
  );
}
