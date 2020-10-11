import 'package:earthquakes_of_world/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/earthquake_filter_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => EarthquakeFilterProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EarthquakeListPage(
          context.watch<EarthquakeFilterProvider>().currentFilter),
    );
  }
}
