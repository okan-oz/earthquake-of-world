import 'dart:async';
import 'package:earthquakes_of_world/ui/pages/pages.dart';
import 'package:earthquakes_of_world/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_internationalized/applocalization.dart' as localization;
import 'common/utils/logger.dart';
import 'provider/earthquake_filter_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.initializeFlutterFire();
  //await FirebaseAdMob.instance.initialize(appId: main_addmob_id);
  runZonedGuarded(() {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EarthquakeFilterProvider())
      ],
      child: MyApp(),
    ));
  }, (error, stackTrace) {
    Logger.recordError(
        error, stackTrace, "  error in my root zone.Error code:27");
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return FriendlyException(
            errorDetails: errorDetails,
          );
        };

        return widget;
      },
      supportedLocales: localization.AppLocalizations.getLocales(),
      localizationsDelegates:
          localization.AppLocalizations.getLocalizationDelegetes(),
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EarthquakeListPage(
          context.watch<EarthquakeFilterProvider>().currentFilter),
    );
  }
}
