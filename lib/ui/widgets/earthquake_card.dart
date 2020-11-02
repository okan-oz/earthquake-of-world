import 'package:auto_size_text/auto_size_text.dart';
import 'package:earthquakes_of_world/common/utils/utils.dart';
import 'package:earthquakes_of_world/models/earthquakes.dart';
import 'package:flutter/material.dart';

class EqCard extends StatelessWidget {
  EqCard(this.eq, this.context, {this.onTap});

  final GestureTapCallback onTap;
  Feature eq;
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    DateTime timeStamp = Utils.converIntToDate(eq.properties.time);
    return Card(
        elevation: 10,
        child: Container(
          height: 75,
          child: ListTile(
            leading: CircleAvatar(
              radius: 45.0,
              child: Text(
                Utils.roundMagnitude(eq.properties.mag),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Utils.decideListTileColor(eq.properties.mag),
            ),
            onTap: onTap,
            title: AutoSizeText(
              eq.properties.place.toString(),
              maxFontSize: 15,
              minFontSize: 9,
              maxLines: 2,
            ),
            subtitle: AutoSizeText(
              timeStamp.toString(),
              maxFontSize: 15,
              minFontSize: 9,
              maxLines: 1,
            ),
            trailing: Icon(
              Icons.view_headline,
              color: Colors.grey.shade600, //Utils.DecideListTileColor(eq.mag),
            ),
          ),
        ));
  }
}
