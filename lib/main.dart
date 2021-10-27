import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/appdata_provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/provider/characteristics_provider.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/interior_provider.dart';
import 'package:studion_mobile/provider/metro_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/search_text_type_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/loader_screen.dart';
import 'package:studion_mobile/screen/room_detail_screen.dart';
import 'package:studion_mobile/screen/filters_screen.dart';
import 'package:studion_mobile/screen/list_screen.dart';
import 'package:studion_mobile/screen/studio_detail_screen.dart';

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
            create: (_) => SearchTypeProvider(),
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
            create: (_) => PriceFilterProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FiltersProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => SearchTextTypeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => MetroProvider(),
          ),
        ],
        child: Consumer<AppDataProvider>(
          builder: (ctx, data, _) {
            final cityProvider = Provider.of<CityProvider>(ctx, listen: false);
            final roomsProvider =
                Provider.of<RoomListProvider>(ctx, listen: false);
            final studiosProvider =
                Provider.of<StudioListProvider>(ctx, listen: false);
            final metroProvider =
                Provider.of<MetroProvider>(ctx, listen: false);
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
                  return FutureBuilder(
                    future: cityProvider.fetchAll(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoaderScreen();
                      }
                      return FutureBuilder(
                        future: metroProvider.fetch(['moscow', 'spb']),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return LoaderScreen();
                          }
                          return FutureBuilder(
                            future: roomsProvider.fetchAll(),
                            builder: (_, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return LoaderScreen();
                              }
                              return FutureBuilder(
                                future: studiosProvider.fetchAll(),
                                builder: (_, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return LoaderScreen();
                                  }
                                  return ListScreen();
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
              routes: {
                ListScreen.routeName: (ctx) => ListScreen(),
                StudioDetailScreen.routeName: (ctx) => StudioDetailScreen(),
                RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
                FiltersScreen.routeName: (ctx) => FiltersScreen(),
              },
            );
          },
        ));
  }
}
