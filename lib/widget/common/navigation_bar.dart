import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/screen/about_screen.dart';
import 'package:studion_mobile/screen/new_home_screen.dart';
import 'package:studion_mobile/screen/new_search_screen.dart';
import 'package:studion_mobile/screen/starred_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
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

  final Map<int, String> navigationRules = {
    0: NewHomeScreen.routeName,
    1: NewSearchScreen.routeName,
    2: StarredScreen.routeName,
    3: AboutScreen.routeName,
  };

  void _onItemTapped(int index) {
    bool isNewRouteSameAsCurrent = false;
    Navigator.popUntil(context, (route) {
      if (route.settings.name == navigationRules[index]) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });
    if (isNewRouteSameAsCurrent) {
      return;
    }
    final provider =
        Provider.of<BottomNavigationIndexProvider>(context, listen: false);
    provider.change(index);
    Navigator.of(context).restorablePushNamedAndRemoveUntil(
        navigationRules[index]!, (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationIndexProvider>(builder: (_, provider, ch) {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: navigationItems,
          currentIndex: provider.selectedIndex,
          selectedItemColor: Colors.indigo,
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
