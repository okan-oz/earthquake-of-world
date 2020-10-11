import 'package:earthquakes_of_world/models/models.dart';
import 'package:earthquakes_of_world/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EarthquakeListPage extends StatelessWidget {
  EarthquakeListPage(this.eqFilter);
  final EarthquakeFilter eqFilter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(),
      body: EarthquakeList(eqFilter),
    );
  }
}
