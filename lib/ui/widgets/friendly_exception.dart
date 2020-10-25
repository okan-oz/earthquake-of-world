import 'package:earthquakes_of_world/common/utils/localization_util.dart';
import 'package:earthquakes_of_world/common/utils/logger.dart';
import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FriendlyException extends StatelessWidget {
  String _title = "";

  FriendlyException({FlutterErrorDetails errorDetails}) {
    if (errorDetails != null) {
      Logger.recordError(errorDetails.exception, errorDetails.stack,
          errorDetails.exceptionAsString());
    }
  }

  FriendlyException.withTitle(this._title);

  @override
  Widget build(BuildContext context) {
    if (_title == "") {
      LocalizationUtil.translate(context, 'FriendlyExceptionTitle');
    }

    return Card(
      margin: EdgeInsets.all(30),
      elevation: 4,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 150,
          child: Center(
            child: ListTile(
                leading: Icon(Icons.build, color: Colors.red),
                title: Text(
                    LocalizationUtil.translate(context, 'UnhandledException')),
                subtitle: Text(_title),
                trailing: GestureDetector(
                  onTap: () async {
                    context.read<EarthquakeFilterProvider>().refresh();
                    return await Future.delayed(Duration(seconds: 1));
                  },
                  child: Icon(
                    Icons.settings_backup_restore,
                    size: 70,
                    semanticLabel: LocalizationUtil.translate(
                        context, 'UnhandledException'),
                    color: Colors.green,
                  ),
                )),
          )),
    );
  }
}
