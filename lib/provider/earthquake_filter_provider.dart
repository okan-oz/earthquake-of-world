import 'package:earthquakes_of_world/models/models.dart';
import 'package:flutter/foundation.dart';

class EarthquakeFilterProvider with ChangeNotifier, DiagnosticableTreeMixin {
  EarthquakeFilterProvider() {
    _filter = EarthquakeFilter(minimumMagnitude: 1, endDate: DateTime.now(), startDate: DateTime.now().add(Duration(days: -1)));
  }

  EarthquakeFilter _filter;

  setInitialValue() {
    _filter = EarthquakeFilter(minimumMagnitude: 1, endDate: DateTime.now(), startDate: DateTime.now().add(Duration(days: -1)));
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }

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

  updateGps(bool useCurrentLocation) {
    _filter.useCurrentLocation = useCurrentLocation;
    notifyListeners();
  }

  EarthquakeFilter get currentFilter {
    return _filter;
  }
}
