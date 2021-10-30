import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/appdata_provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/provider/characteristics_provider.dart';
import 'package:studion_mobile/provider/city_provider.dart';
import 'package:studion_mobile/provider/equipment_provider.dart';
import 'package:studion_mobile/provider/facilities_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/interior_provider.dart';
import 'package:studion_mobile/provider/metro_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/search_text_type_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/error_screen.dart';
import 'package:studion_mobile/screen/loader_screen.dart';
import 'package:studion_mobile/screen/room_detail_screen.dart';
import 'package:studion_mobile/screen/filters_screen.dart';
import 'package:studion_mobile/screen/list_screen.dart';
import 'package:studion_mobile/screen/starred_screen.dart';
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
        ChangeNotifierProvider(
          create: (_) => FacilitiesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StarredProvider(),
        ),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          title: 'StudiON',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: retriableListScreen(ctx, providerLoading),
          routes: {
            ListScreen.routeName: (ctx) => ListScreen(),
            StudioDetailScreen.routeName: (ctx) => StudioDetailScreen(),
            RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
            FiltersScreen.routeName: (ctx) => FiltersScreen(),
            StarredScreen.routeName: (ctx) => StarredScreen(),
          },
        );
      },
    );
  }
}

Widget retriableListScreen(BuildContext ctx, FutureFunction futureFunction) {
  return FutureBuilder(
      future: futureFunction(ctx),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoaderScreen();
        }
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        return ListScreen();
      });
}

Future<void> providerLoading(BuildContext ctx) {
  final appDataProvider = Provider.of<AppDataProvider>(ctx, listen: false);
  final cityProvider = Provider.of<CityProvider>(ctx, listen: false);
  final roomsProvider = Provider.of<RoomListProvider>(ctx, listen: false);
  final studiosProvider = Provider.of<StudioListProvider>(ctx, listen: false);
  final metroProvider = Provider.of<MetroProvider>(ctx, listen: false);
  final interiorProvider = Provider.of<InteriorProvider>(ctx, listen: false);
  final equipmentProvider = Provider.of<EquipmentProvider>(ctx, listen: false);
  final characteristicProvider =
      Provider.of<CharacteristicProvider>(ctx, listen: false);
  final facilitiesProvider =
      Provider.of<FacilitiesProvider>(ctx, listen: false);

  return appDataProvider
      .fetch()
      .then((_) => cityProvider.fetchAll())
      .then((_) => roomsProvider.fetch())
      .then((_) => studiosProvider.fetch())
      .then((_) => metroProvider.fetch(['moscow', 'spb']))
      .then((_) => interiorProvider.fetch())
      .then((_) => equipmentProvider.fetch())
      .then((_) => characteristicProvider.fetch())
      .then((_) => facilitiesProvider.fetch());
}

typedef FutureFunction = Future Function(BuildContext);
