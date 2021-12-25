import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/screen/about_screen.dart';
import 'package:studion_mobile/screen/new_home_screen.dart';
import 'package:studion_mobile/screen/new_search_screen.dart';
import 'package:studion_mobile/screen/starred_screen.dart';
import 'package:studion_mobile/util/theme.dart';

class CommonNavigationBar extends StatefulWidget {
  @override
  _CommonNavigationBarState createState() => _CommonNavigationBarState();
}

class _CommonNavigationBarState extends State<CommonNavigationBar> {
  void _onItemTapped(int index) {
    _toScreen(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationIndexProvider>(builder: (_, provider, ch) {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: navigationItems,
          currentIndex: provider.selectedIndex,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.black45,
          onTap: _onItemTapped,
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          selectedLabelStyle: const TextStyle(
            color: Colors.black,
          ));
    });
  }
}

final Map<int, String> navigationRules = {
  0: NewHomeScreen.routeName,
  1: NewSearchScreen.routeName,
  2: StarredScreen.routeName,
  3: AboutScreen.routeName,
};

final List<BottomNavigationBarItem> navigationItems = [
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.home),
    label: 'Обзор',
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.searchLocation),
    label: 'Поиск',
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.heart),
    label: 'Избранное',
  ),
  const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.info),
    label: 'Инфо',
  ),
];

void toHomeScreen(BuildContext ctx) {
  _toScreen(ctx, 0);
}

void toSearchScreen(BuildContext ctx) {
  _toScreen(ctx, 1);
}

void toStarredScreen(BuildContext ctx) {
  _toScreen(ctx, 2);
}

void toAboutScreen(BuildContext ctx) {
  _toScreen(ctx, 3);
}

void _toScreen(BuildContext ctx, int index) {
  final provider = Provider.of<BottomNavigationIndexProvider>(ctx, listen: false);
  bool isNewRouteSameAsCurrent = false;
  Navigator.popUntil(ctx, (route) {
    if (route.settings.name == navigationRules[index]) {
      isNewRouteSameAsCurrent = true;
    }
    return true;
  });
  if (isNewRouteSameAsCurrent) {
    return;
  }
  provider.change(index);
  Navigator.of(ctx).restorablePushNamedAndRemoveUntil(
    navigationRules[index]!,
    (r) => false,
  );
}
