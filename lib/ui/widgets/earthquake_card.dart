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
    DateTime timeStamp =
        DateTime.fromMillisecondsSinceEpoch(eq.properties.time);

    return Card(
        elevation: 10,
        child: Container(
          height: 75,
          child: ListTile(
            leading: CircleAvatar(
              radius: 45.0,
              child: Text(
                eq.properties.mag.toString(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Utils.DecideListTileColor(eq.properties.mag),
            ),
            onTap: onTap,
            title: Text(eq.properties.place.toString()),
            subtitle: Text(timeStamp.toString()),
            trailing: Icon(
              Icons.view_headline,
              color: Colors.grey.shade600, //Utils.DecideListTileColor(eq.mag),
            ),
          ),
        ));
  }
}
