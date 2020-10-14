import 'package:earthquakes_of_world/models/models.dart';
import 'package:earthquakes_of_world/service/earthquake_usgs.dart';

class EarthquakeProvider {
  static Future<ActionResult<EarthquakeCollection>> getEarthquakeData(
      EarthquakeFilter eqFilter) async {
    final ActionResult<String> actionResultService =
        await EarthquakeUsgsService.getEarthquakeByFilter(eqFilter);
    ActionResult<EarthquakeCollection> result =
        ActionResult<EarthquakeCollection>();

    if (actionResultService.isSucces) {
      EarthquakeCollection earthquakeCollection =
          _convertEarthquakeCollection(actionResultService);
      result.resultData = earthquakeCollection;
      result.isSucces = true;
    } else {
      result.isSucces = false;
    }

    return result;
  }

  static EarthquakeCollection _convertEarthquakeCollection(
      ActionResult<String> actionResult) {
    try {
      EarthquakeCollection earthquakeCollection =
          earthquakeCollectionFromJson(actionResult.resultData);
      ActionResult<EarthquakeCollection> result =
          ActionResult<EarthquakeCollection>();
      result.resultData = earthquakeCollection;
      result.isSucces = true;
      return earthquakeCollection;
    } catch (e, s) {}

    return null;
  }
}
