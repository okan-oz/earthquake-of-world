 import 'package:earthquakes_of_world/common/constants/usgs_service_constants.dart' as service_constant ;
import 'package:earthquakes_of_world/models/models.dart';
import 'package:http/http.dart' as http;

class EarthquakeUsgsService {
  static Future<ActionResult<String>> getEarthquakeByFilter(
      EarthquakeFilter eqFilter) async {
    String url = service_constant.service_url;
    ActionResult<String> result = ActionResult<String>();
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        result.isSucces = true;
        result.resultData = response.body;
      } else {
        ExceptionModel exceptionModel = ExceptionModel();

        exceptionModel.friendlyMessage =
            'Request failed (Service is unreachable)';
        result.isSucces = false;
        result.resultData = '';
        result.exception = exceptionModel;
      }
    } catch (e, s) {
      ExceptionModel exceptionModel = ExceptionModel();
      exceptionModel.exception = e;
      exceptionModel.stackTrace = s;
      exceptionModel.friendlyMessage = 'Request failed (Unhandled exception)';
      result.isSucces = false;
      result.resultData = '';
      result.exception = exceptionModel;
    }
    return result;
  }
}
