import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
import 'package:studion_mobile/screen/about_screen.dart';
import 'package:studion_mobile/screen/new_home_screen.dart';
import 'package:studion_mobile/screen/new_search_screen.dart';
import 'package:studion_mobile/screen/room_detail_screen.dart';
import 'package:studion_mobile/screen/filters_screen.dart';
import 'package:studion_mobile/screen/list_screen.dart';
import 'package:studion_mobile/screen/starred_screen.dart';
import 'package:studion_mobile/screen/studio_detail_screen.dart';
import 'package:studion_mobile/util/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.subscribeToTopic('common');
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundNotification);
    FirebaseAnalytics analytics = FirebaseAnalytics();
    return MultiProvider(
      providers: [
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
          theme: themeData,
          home: retriableHomeScreen(ctx, providerLoading),
          routes: {
            NewHomeScreen.routeName: (ctx) => NewHomeScreen(),
            NewSearchScreen.routeName: (ctx) => NewSearchScreen(),
            // RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
            // FiltersScreen.routeName: (ctx) => FiltersScreen(),
            StarredScreen.routeName: (ctx) => StarredScreen(),
            AboutScreen.routeName: (ctx) => AboutScreen(),
          },
          navigatorObservers: [
            FirebaseAnalyticsObserver(analytics: analytics),
          ],
        );
      },
    );
  }

  void _handleMessage(BuildContext context, RemoteMessage message) {
    Navigator.pushNamedAndRemoveUntil(
        context, ListScreen.routeName, (r) => false);
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
          FirebaseCrashlytics.instance
              .recordError(snapshot.error, snapshot.stackTrace);
          return ErrorScreen();
        }
        return NewHomeScreen();
      });
}

Widget retriableHomeScreen(BuildContext ctx, FutureFunction futureFunction) {
  return FutureBuilder(
      future: futureFunction(ctx),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoaderScreen();
        }
        if (snapshot.hasError) {
          FirebaseCrashlytics.instance
              .recordError(snapshot.error, snapshot.stackTrace);
          return ErrorScreen();
        }
        return NewSearchScreen();
      });
}

Future<void> providerLoading(BuildContext ctx) {
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

  return cityProvider
      .fetchAll()
      .then((_) => roomsProvider.fetch())
      .then((_) => studiosProvider.fetch())
      .then((_) => metroProvider.fetch(['moscow', 'spb']))
      .then((_) => interiorProvider.fetch())
      .then((_) => equipmentProvider.fetch())
      .then((_) => characteristicProvider.fetch())
      .then((_) => facilitiesProvider.fetch());
}

Future<void> _handleBackgroundNotification(RemoteMessage msg) async {}

typedef FutureFunction = Future Function(BuildContext);
