import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomSearchAppBarState createState() => _CustomSearchAppBarState();

  @override
  Size get preferredSize {
    return Size(double.infinity, 400);
  }
}

class _CustomSearchAppBarState extends State<CustomSearchAppBar> {
  double appBarInitializeValue = 100;
  double appBarHeight = 100;
  double searchBarOpenHeight = 40;
  double filterBarOpenHeight = 120;
  bool searchBarIsOpen = false;
  bool filterBarIsOpen = false;
  var _textFormFieldKey = GlobalKey();

  DateTimeRange myDateRange;

  List<bool> isSelected = [false, false, false, true, true, true,true];

  Widget _getSearchText() {
    if (searchBarIsOpen) {
      return Container(
          width: 300,
          height: 40,
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.white, width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10.0)),
          child: TextField(
            decoration:
                InputDecoration.collapsed(hintText: 'Lokasyon giriniz..'),
            autofocus: true,
          ));
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _getRangeSlider(BuildContext context) {
    if (filterBarIsOpen) {
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
                isSelected[index] = !isSelected[index];
                //context.read<EarthquakeFilterProvider>().update(filters);
              });
            },
          ));
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _getDateRange() {
    if (filterBarIsOpen) {
      return Container(
          height: 60,
          width: 300,
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.white, width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(10.0)),
          child: DateRangeField(
              width: 250,
              margin: EdgeInsets.all(0),
              dateFormat: DateFormat('dd-MM-yyyy'),
              context: context,
              decoration: InputDecoration(
                labelText: 'Date Range',
                prefixIcon: Icon(Icons.date_range, color: Colors.red),
                hintText: 'Please select a start and end date',
              ),
              initialValue: DateTimeRange(
                start: DateTime.now(),
                end: DateTime.now(),
              ),
              validator: (value) {
                if (value.start.isBefore(DateTime.now())) {
                  return 'Please enter a later start date';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  myDateRange = value;
                });
              }));
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appBarHeight,
      child: Container(
        decoration: BoxDecoration(),
        width: MediaQuery.of(context).size.width,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Text(
                            "Son Depremler",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            filterBarIsOpen = !filterBarIsOpen;
                            if (filterBarIsOpen) {
                              searchBarIsOpen = false;
                              appBarHeight =
                                  appBarInitializeValue + filterBarOpenHeight;
                            } else {
                              appBarHeight = appBarInitializeValue;
                            }
                          });
                        },
                        child: Icon(
                          Icons.filter_list_outlined,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            searchBarIsOpen = !searchBarIsOpen;
                            if (searchBarIsOpen) {
                              filterBarIsOpen = false;
                              appBarHeight =
                                  appBarInitializeValue + searchBarOpenHeight;
                            } else {
                              appBarHeight = appBarInitializeValue;
                            }
                          });
                        },
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            searchBarIsOpen = !searchBarIsOpen;
                            if (searchBarIsOpen) {
                              filterBarIsOpen = false;
                              appBarHeight =
                                  appBarInitializeValue + searchBarOpenHeight;
                            } else {
                              appBarHeight = appBarInitializeValue;
                            }
                          });
                        },
                        child: Icon(
                          Icons.cleaning_services,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                _getSearchText(),
                _getDateRange(),
                SizedBox(
                  height: 5,
                ),
                _getRangeSlider(context),
                SizedBox(
                  height: 5,
                ),
              ],
            )),
      ),
    );
  }
}
