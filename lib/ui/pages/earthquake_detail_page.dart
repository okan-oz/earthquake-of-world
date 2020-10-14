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
        body: Container(
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
                  radius: 20,
                  backgroundColor: Utils.DecideListTileColor(widget.earthquake.properties.mag),
                  child: Text(widget.earthquake.properties.mag.toString(),
                      style: _getAppBarDetailTextStyle()),
                ),
                title: Text(
                  widget.earthquake.properties.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.earthquake.properties.time.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
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
              ListTile(
                leading: Icon(
                  Icons.dialpad,
                  color: Colors.brown,
                ),
                title: Text("Derinlik"),
                subtitle: Text(widget.earthquake.properties.dmin.toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.timer,
                  color: Colors.green,
                ),
                title: Text("Tarih"),
                subtitle: Text(widget.earthquake.properties.time.toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                title: Text("Lokasyon"),
                subtitle: Text(widget.earthquake.properties.mag.toString()),
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.blue,
                    semanticLabel: "Paylaş",
 
                  ),
                  onPressed: () {
                    final RenderBox box = context.findRenderObject();
                    Share.share(
                        "${widget.earthquake.properties.time.toString()} tarihinde , ${widget.earthquake.properties.mag} lokasyonunda , şiddeti ${widget.earthquake.properties.mag.toString()} olan deprem oldu . ",
                        subject: "Deprem oldu !",
                        sharePositionOrigin:
                            box.localToGlobal(Offset.zero) & box.size);
                  },
                ),
                title: Text("Paylaş"),
                subtitle: Text("Sosyal Medyada Paylaş"),
              ),
              // ListTiles++
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 350,
              width: 50,
              child: Container()//MapSample(widget.earthquake),
            ),
          ),
        ],
      ),
    ));
  }
}


  