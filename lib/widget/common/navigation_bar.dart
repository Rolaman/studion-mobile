import 'package:flutter/material.dart';
import 'package:studion_mobile/screen/room_list_screen.dart';
import 'package:studion_mobile/screen/studio_list_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> navigationItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.place),
      label: 'Студии',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Залы',
    ),
    // TODO: next version
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.book),
    //   label: 'Брони',
    // ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_box),
      label: 'Профиль',
    ),
  ];

  final Map<int, String> navigationRules = {
    0: StudioListScreen.routeName,
    1: RoomListScreen.routeName,
    2: '/profile',
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pushReplacementNamed(navigationRules[index]!);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: navigationItems,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.black45,
      onTap: _onItemTapped,
    );
  }
}
