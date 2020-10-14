import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class DateRangeControl extends StatefulWidget {
  @override
  _DateRangeControlState createState() => _DateRangeControlState();
}

class _DateRangeControlState extends State<DateRangeControl> {
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  DateTime _startDate = DateTime.now().add(Duration(days: -1));
  DateTime _endDate = DateTime.now().add(Duration(days: -1));
  @override
  void initState() {
    super.initState();
  }

  String _getDateText(DateTime dateTime) {
    return dateTime.day.toString() +
        '.' +
        dateTime.month.toString() +
        '.' +
        dateTime.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.centerLeft,
            width: 150,
            height: 40,
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            padding: EdgeInsets.fromLTRB(10, 4, 0, 4),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.white, width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10.0)),
            child: GestureDetector(
              child: TextField(
                controller: _startDateController
                  ..text = _getDateText(context
                      .watch<EarthquakeFilterProvider>()
                      .currentFilter
                      .startDate),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1998, 1, 1),
                      maxTime: DateTime.now(),
                      theme: DatePickerTheme(
                          headerColor: Colors.red,
                          backgroundColor: Colors.grey.shade700,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {
                    _startDateController.value =
                        TextEditingValue(text: _getDateText(date));
                    _startDate = date;
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.date_range),
                  border: InputBorder.none,
                ),
                autofocus: true,
              ),
            )),
        Container(
            alignment: Alignment.centerLeft,
            width: 150,
            height: 40,
            margin: EdgeInsets.fromLTRB(20, 0, 30, 0),
            padding: EdgeInsets.fromLTRB(10, 4, 0, 4),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.white, width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10.0)),
            child: GestureDetector(
              child: TextField(
                controller: _endDateController
                  ..text = _getDateText(context
                      .watch<EarthquakeFilterProvider>()
                      .currentFilter
                      .endDate),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1998, 1, 1),
                      maxTime: DateTime.now(),
                      theme: DatePickerTheme(
                          headerColor: Colors.red,
                          backgroundColor: Colors.grey.shade700,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {
                    _endDateController.value =
                        TextEditingValue(text: _getDateText(date));
                    _endDate = date;
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.date_range),
                  border: InputBorder.none,
                ),
                autofocus: true,
              ),
            )),
      ],
    ));
  }
}
