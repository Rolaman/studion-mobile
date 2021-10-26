import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/screen/room_list_screen.dart';
import 'package:studion_mobile/screen/studio_list_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  final List<BottomNavigationBarItem> navigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.placemark),
      label: 'Студии',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.building_2_fill),
      label: 'Залы',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: 'Профиль',
    ),
  ];

  final Map<int, String> navigationRules = {
    0: StudioListScreen.routeName,
    1: RoomListScreen.routeName,
    2: '/profile',
  };

  void _onItemTapped(int index) {
    Provider.of<BottomNavigationIndexProvider>(context, listen: false)
        .change(index);
    Navigator.of(context).pushReplacementNamed(navigationRules[index]!);
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
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.black,
          ));
    });
  }
}
