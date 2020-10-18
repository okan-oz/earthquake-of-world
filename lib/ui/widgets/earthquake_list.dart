import 'package:earthquakes_of_world/models/earthquake_filter.dart';
import 'package:earthquakes_of_world/models/earthquakes.dart';
import 'package:earthquakes_of_world/models/models.dart';
import 'package:earthquakes_of_world/provider/earthquake_provider.dart';
import 'package:earthquakes_of_world/ui/pages/pages.dart';
import 'package:earthquakes_of_world/ui/widgets/empty_data.dart';
import 'package:earthquakes_of_world/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EarthquakeList extends StatefulWidget {
  EarthquakeList(this.eqFilter);
  final EarthquakeFilter eqFilter;
  @override
  _EarthquakeListState createState() => _EarthquakeListState();
}

class _EarthquakeListState extends State<EarthquakeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _prepareEQList(),
    );
  }

  Widget _prepareEQList() {
    return FutureBuilder(
        future: EarthquakeProvider.getEarthquakeData(widget.eqFilter),
        builder: (BuildContext context,
            AsyncSnapshot<ActionResult<EarthquakeCollection>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return FriendlyException();
              }
              else if(snapshot.data.resultData.features==null || snapshot.data.resultData.features.length==0)
              {
                return EmptyData();
              }
               else {
                return ListView.builder(
                    itemCount: snapshot.data.resultData.features.length,
                    itemBuilder: (context, index) {
                      return EqCard(snapshot.data.resultData.features[index], context, onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return EartquakeDetailPage(snapshot.data.resultData.features[index]);
                            },
                          ),
                        );
                      });
                    });
              }
          }
        });
  }
}
