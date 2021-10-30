import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/screen/list_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  final List<BottomNavigationBarItem> navigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.building_2_fill),
      label: 'Поиск',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: 'Профиль',
    ),
  ];

  final Map<int, String> navigationRules = {
    0: ListScreen.routeName,
    1: '/profile',
  };

  void _onItemTapped(int index) {
    final provider = Provider.of<BottomNavigationIndexProvider>(context, listen: false);
    if (provider.selectedIndex == index) {
      return;
    }
    provider.change(index);
    Navigator.of(context).restorablePushNamedAndRemoveUntil(navigationRules[index]!, (r) => false);
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
