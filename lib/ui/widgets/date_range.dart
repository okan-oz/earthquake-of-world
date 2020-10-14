import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class DateRange extends StatefulWidget {
  @override
  _DateRangeState createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
        color: Colors.yellow,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1998, 1, 1),
                      maxTime: DateTime.now(),
                      theme: DatePickerTheme(
                          headerColor: Colors.orange,
                          backgroundColor: Colors.blue,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                
                  alignment: Alignment.centerLeft,
                    width: 150,
                    height: 40,
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      onChanged: (text) {
                        print("First text field: $text");
                        context
                            .read<EarthquakeFilterProvider>()
                            .updateSearchText(text);
                      },
                      //controller: _searchController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: InputBorder.none,
                      ),
                      autofocus: true,
                    ))),
            FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1998, 1, 1),
                      maxTime: DateTime.now(),
                      theme: DatePickerTheme(
                          headerColor: Colors.orange,
                          backgroundColor: Colors.blue,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                    width: 150,
                    height: 40,
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      onChanged: (text) {
                        print("First text field: $text");
                        context
                            .read<EarthquakeFilterProvider>()
                            .updateSearchText(text);
                      },
                      //controller: _searchController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        border: InputBorder.none,
                      ),
                      autofocus: true,
                    ))),
          ],
        ));
  }
}
