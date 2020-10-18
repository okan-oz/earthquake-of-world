import 'package:earthquakes_of_world/common/utils/localization_util.dart';
import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyData extends StatelessWidget {
  String _title = '';

  EmptyData();

  EmptyData.withTitle(this._title);

  @override
  Widget build(BuildContext context) {
    if (_title == '') {
      LocalizationUtil.translate(context, 'EmptyDateMessage');
    }

    return Card(
      margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
      elevation: 4,
      child: Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 150,
          child: Center(
            child: ListTile(
                leading: Icon(
                  Icons.emoji_nature_sharp,
                  color: Colors.red,
                  size: 70,
                ),
                title: Text(
                    LocalizationUtil.translate(context, 'EmptyDateMessage')),
                subtitle: Text(_title),
                trailing: GestureDetector(
                  onTap: () async {
                    context.read<EarthquakeFilterProvider>().refresh();
                    return await Future.delayed(Duration(seconds: 1));
                  },
                  child: Icon(
                    Icons.settings_backup_restore,
                    size: 70,
                    semanticLabel:
                        LocalizationUtil.translate(context, 'EmptyDateMessage'),
                    color: Colors.green,
                  ),
                )),
          )),
    );
  }
}
