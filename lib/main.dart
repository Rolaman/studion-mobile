import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/appdata_provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/provider/characteristics_provider.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/interior_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/room_studio_selector_bar_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/loader_screen.dart';
import 'package:studion_mobile/screen/room_detail_screen.dart';
import 'package:studion_mobile/screen/room_filters_screen.dart';
import 'package:studion_mobile/screen/room_list_screen.dart';
import 'package:studion_mobile/screen/studio_detail_screen.dart';
import 'package:studion_mobile/screen/studio_list_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppDataProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => StudioListProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => RoomListProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => BottomNavigationIndexProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CityProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => RoomStudioSelectorBarProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => EquipmentProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => InteriorProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CharacteristicProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FiltersProvider(),
          ),
        ],
        child: Consumer<AppDataProvider>(
          builder: (ctx, data, _) {
            return MaterialApp(
              title: 'StudiON',
              theme: ThemeData(
                primarySwatch: Colors.indigo,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: FutureBuilder(
                future: data.fetch(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoaderScreen();
                  }
                  return StudioListScreen();
                },
              ),
              routes: {
                RoomListScreen.routeName: (ctx) => RoomListScreen(),
                StudioListScreen.routeName: (ctx) => StudioListScreen(),
                StudioDetailScreen.routeName: (ctx) => StudioDetailScreen(),
                RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
                RoomFiltersScreen.routeName: (ctx) => RoomFiltersScreen(),
              },
            );
          },
        ));
  }
}
