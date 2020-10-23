import 'package:earthquakes_of_world/common/utils/logger.dart';
import 'package:earthquakes_of_world/models/models.dart';
import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:earthquakes_of_world/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EarthquakeListPage extends StatelessWidget {
  EarthquakeListPage(this.eqFilter);
  final EarthquakeFilter eqFilter;
  @override
  Widget build(BuildContext context) {
    try {
      throw 'error_example';
    } catch (e, s) {
      Logger.recordError(e, s, 'Error example');
    }

    return Scaffold(
      appBar: CustomSearchAppBar(),
      body: RefreshIndicator(
        child: EarthquakeList(eqFilter),
        onRefresh: () async {
          context.read<EarthquakeFilterProvider>().refresh();
          return await Future.delayed(Duration(seconds: 1));
        },
      ),
    );
  }
}
