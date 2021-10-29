import 'package:earthquakes_of_world/common/utils/utils.dart';
import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRangeSlider extends StatefulWidget {
  @override
  _RangeSliderState createState() => _RangeSliderState();
}

class _RangeSliderState extends State<CustomRangeSlider> {
  List<bool> isSelected = [true, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    double boxSize = 45;
    return Container(
        alignment: Alignment.center,
        height: 45,
        // width: 300,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: ToggleButtons(
          splashColor: Colors.green,
          disabledColor: Colors.red,
          selectedBorderColor: Colors.grey.shade900,
          children: [
            Icon(Icons.two_k_plus, size: boxSize, color: Utils.decideListTileColor(2)),
            Icon(Icons.three_k_plus, size: boxSize, color: Utils.decideListTileColor(3)),
            Icon(Icons.four_k_plus, size: boxSize, color: Utils.decideListTileColor(4)),
            Icon(Icons.five_k_plus, size: boxSize, color: Utils.decideListTileColor(5)),
            Icon(Icons.six_k_plus, size: boxSize, color: Utils.decideListTileColor(6)),
            Icon(
              Icons.seven_k_plus,
              size: boxSize,
              color: Utils.decideListTileColor(7),
            ),
            // Icon(
            //   Icons.eight_k_plus,
            //   size: boxSize,
            //   color: Utils.decideListTileColor(8),
            // )
          ],
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = false;
              }
              isSelected[index] = true;
              context.read<EarthquakeFilterProvider>().updateMagnitude(index + 2);
            });
          },
        ));
  }
}
