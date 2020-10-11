
import 'package:earthquakes_of_world/models/models.dart';
import 'package:flutter/foundation.dart';

class EarthquakeFilterProvider with ChangeNotifier, DiagnosticableTreeMixin {
  EarthquakeFilterProvider() {
    _filter = EarthquakeFilter(
        endDate: DateTime.now(),
        startDate: DateTime.now().add(Duration(hours: -12)));
  }
  EarthquakeFilter _filter;

  update(EarthquakeFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  EarthquakeFilter get currentFilter {
    return _filter;
  }
}
