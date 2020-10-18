import 'package:earthquakes_of_world/common/utils/localization_util.dart';
import 'package:flutter/material.dart';

class FriendlyException extends StatelessWidget {
  String _title = "";

  FriendlyException();

  FriendlyException.withTitle(this._title);

  @override
  Widget build(BuildContext context) {
    if (_title == "") {
      LocalizationUtil.translate(context, 'FriendlyExceptionTitle');
    }

    return Card(
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
              title: Text(LocalizationUtil.translate(context, 'UnhandledException')),
              subtitle: Text(_title),
              // trailing: Icon(
              //   Icons.settings_backup_restore,
              //   size: 70,
              //   semanticLabel: "Çok üzgünüz ..",
              //   color: Colors.green,
              // ),
            ),
          )),
    );
  }
}
