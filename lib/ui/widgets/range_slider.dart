import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRangeSlider extends StatefulWidget {
  @override
  _RangeSliderState createState() => _RangeSliderState();
}

class _RangeSliderState extends State<CustomRangeSlider> {
  List<bool> isSelected = [false, false, true, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 300,
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.white, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: ToggleButtons(
          disabledColor: Colors.red,
          selectedBorderColor: Colors.grey.shade700,
          children: [
            Icon(Icons.two_k_plus, size: 40, color: Colors.blue.shade200),
            Icon(Icons.three_k_plus, size: 40, color: Colors.blue.shade500),
            Icon(Icons.four_k_plus, size: 40, color: Colors.yellow.shade700),
            Icon(Icons.five_k_plus, size: 40, color: Colors.orange),
            Icon(Icons.six_k_plus, size: 40, color: Colors.orange.shade800),
            Icon(
              Icons.seven_k,
              size: 40,
              color: Colors.red,
            ),
            Icon(
              Icons.eight_k_plus,
              size: 40,
              color: Colors.red,
            )
          ],
          isSelected: isSelected,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = false;
              }
              isSelected[index] = true;
              context
                  .read<EarthquakeFilterProvider>()
                  .updateMagnitude(index + 2);
            });
          },
        ));
  }
}
