import 'package:earthquakes_of_world/models/models.dart';
import 'package:flutter/foundation.dart';

class EarthquakeFilterProvider with ChangeNotifier, DiagnosticableTreeMixin {
  EarthquakeFilterProvider() {
    _filter = EarthquakeFilter(
        minimumMagnitude: 4,
        endDate: DateTime.now(),
        startDate: DateTime.now().add(Duration(days: -1)));
  }
  EarthquakeFilter _filter;

  update(EarthquakeFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  updateSearchText(String searchText) {
    _filter.locationText = searchText;
    notifyListeners();
  }

  updateMagnitude(int m) {
    _filter.minimumMagnitude = m;
    notifyListeners();
  }

  updateDateRange(DateTime startDate, DateTime endDate) {
    _filter.endDate = endDate;
    _filter.startDate = startDate;
    notifyListeners();
  }

  EarthquakeFilter get currentFilter {
    return _filter;
  }
}
