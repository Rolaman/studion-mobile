import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: 'Студии',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Залы',
        ),
        // TODO: next version
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.book),
        //   label: 'Брони',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Профиль',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.black45,
      onTap: _onItemTapped,
    );
  }
}
