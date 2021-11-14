import 'package:earthquakes_of_world/common/utils/localization_util.dart';
import 'package:earthquakes_of_world/common/utils/utils.dart';
import 'package:earthquakes_of_world/models/models.dart';
import 'package:earthquakes_of_world/ui/widgets/map_samle.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class EartquakeDetailPage extends StatefulWidget {
  EartquakeDetailPage(this.earthquake);
  Feature earthquake;
  @override
  _EartquakeDetailPageState createState() => _EartquakeDetailPageState();
}

class _EartquakeDetailPageState extends State<EartquakeDetailPage> {
  TextStyle _getAppBarDetailTextStyle() {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              return;
            },
            expandedHeight: 130.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: false,
              titlePadding:
                  EdgeInsetsDirectional.only(start: 10, bottom: 16, top: 10),
              title: ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  backgroundColor: Utils.decideListTileColor(
                      widget.earthquake.properties.mag),
                  child: Text( Utils.roundMagnitude(widget.earthquake.properties.mag),
                      style: _getAppBarDetailTextStyle()),
                ),
              ),
              
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/depremAppBar.jpg",
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.modulate,
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.dialpad,
                      size:29,
                      color: Colors.brown,
                    ),
                    Text(
                      LocalizationUtil.translate(context, 'Depth'),
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                title:
                    Text(widget.earthquake.geometry.coordinates[2].toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.timer,
                  color: Colors.green,
                  size:35
                ),
                title: Text(
                   Utils.formatDate(Utils.converIntToDate(widget.earthquake.properties.time) )),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 35,
                ),
                title: Text(widget.earthquake.properties.place),
              ),
              GestureDetector(
                onTap: () {
                  final RenderBox box = context.findRenderObject();
                  String earthquakeHappenedText =
                      LocalizationUtil.translate(context, 'EarthquakeHappened');
                  earthquakeHappenedText = Utils.replaceTextOfShareEarthquake(
                      earthquakeHappenedText,
                      widget.earthquake.properties.mag.toString(),
                      widget.earthquake.properties.place,
                      Utils.converIntToDate(widget.earthquake.properties.time)
                          .toString());
                  Share.share(earthquakeHappenedText,
                      subject: LocalizationUtil.translate(
                          context, 'EarthquakeHappenedSubject'),
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(
                     
                      Icons.share,
                      color: Colors.blue,
                      size: 30,
                      semanticLabel:
                          LocalizationUtil.translate(context, 'Share'),
                    ),
                    onPressed: () {
                      final RenderBox box = context.findRenderObject();
                      String earthquakeHappenedText =
                          LocalizationUtil.translate(
                              context, 'EarthquakeHappened');
                      earthquakeHappenedText =
                          Utils.replaceTextOfShareEarthquake(
                              earthquakeHappenedText,
                              widget.earthquake.properties.mag.toString(),
                              widget.earthquake.properties.place,
                              Utils.converIntToDate(
                                      widget.earthquake.properties.time)
                                  .toString());
                      Share.share(earthquakeHappenedText,
                          subject: LocalizationUtil.translate(
                              context, 'EarthquakeHappenedSubject'),
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
                  ),
                  title: Text(
                    LocalizationUtil.translate(context, 'Share'),
                  ),
                  // subtitle: Text(
                  //   LocalizationUtil.translate(context, 'Share'),
                  // ),
                ),
              )
              // ListTiles++
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 450,
              width: 50,
              child: MapSample(widget.earthquake),
            ),
          ),
        ],
      ),
    )));
  }
}
