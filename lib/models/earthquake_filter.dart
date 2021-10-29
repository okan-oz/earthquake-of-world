class EarthquakeFilter {
  EarthquakeFilter({this.startDate, this.endDate, this.minimumMagnitude, this.useCurrentLocation = false});
  DateTime startDate;
  DateTime endDate;
  int minimumMagnitude;
  String locationText;
  String minLatitude = '35.0000';
  String maxLatitude = '43.02683';
  String minLongitude = '24.90902';
  String maxLongitude = '45.5742';
  bool useCurrentLocation = false;
}
//  For Turkey
// Latitude from 35.9025 to 42.02683
//  longitude from 25.90902 to 44.5742.
