import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studion_mobile/provider/bottom_navigation_index_provider.dart';
import 'package:studion_mobile/provider/app_config_provider.dart';
import 'package:studion_mobile/provider/filters_provider.dart';
import 'package:studion_mobile/provider/metro_provider.dart';
import 'package:studion_mobile/provider/price_filter_provider.dart';
import 'package:studion_mobile/provider/room_list_provider.dart';
import 'package:studion_mobile/provider/search_text_provider.dart';
import 'package:studion_mobile/provider/search_type_provider.dart';
import 'package:studion_mobile/provider/starred_provider.dart';
import 'package:studion_mobile/provider/starred_type_provider.dart';
import 'package:studion_mobile/provider/studio_list_provider.dart';
import 'package:studion_mobile/screen/error_screen.dart';
import 'package:studion_mobile/screen/loader_screen.dart';
import 'package:studion_mobile/screen/about_screen.dart';
import 'package:studion_mobile/screen/new_home_screen.dart';
import 'package:studion_mobile/screen/new_search_screen.dart';
import 'package:studion_mobile/screen/new_starred_screen.dart';
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
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppConfigProvider(),
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
          create: (_) => SearchTypeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PriceFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FiltersProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchTextProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MetroProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StarredProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StarredTypeProvider(),
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
            NewStarredScreen.routeName: (ctx) => NewStarredScreen(),
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
        context, NewHomeScreen.routeName, (r) => false);
  }
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
        return NewHomeScreen();
      });
}

Future<void> providerLoading(BuildContext ctx) {
  final appConfigProvider = Provider.of<AppConfigProvider>(ctx, listen: false);
  final roomsProvider = Provider.of<RoomListProvider>(ctx, listen: false);
  final studiosProvider = Provider.of<StudioListProvider>(ctx, listen: false);
  final metroProvider = Provider.of<MetroProvider>(ctx, listen: false);
  final starredProvider = Provider.of<StarredProvider>(ctx, listen: false);

  return appConfigProvider
      .fetch()
      .then((_) => roomsProvider.fetch())
      .then((_) => studiosProvider.fetch())
      // TODO: remove moscow hardcode
      .then((_) => metroProvider.fetch("moscow"))
      .then((_) => starredProvider.fetch());
}

Future<void> _handleBackgroundNotification(RemoteMessage msg) async {}

typedef FutureFunction = Future Function(BuildContext);
