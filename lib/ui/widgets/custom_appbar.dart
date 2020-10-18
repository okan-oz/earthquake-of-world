import 'package:earthquakes_of_world/common/utils/localization_util.dart';
import 'package:earthquakes_of_world/provider/earthquake_filter_provider.dart';
import 'package:earthquakes_of_world/ui/widgets/range_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'date_range_widget.dart';

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
  TextEditingController _searchController;

  DateTimeRange myDateRange;

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
            onChanged: (text) {
              print("First text field: $text");
              context.read<EarthquakeFilterProvider>().updateSearchText(text);
            },
            controller: _searchController,
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
      return CustomRangeSlider();
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _getDateRange2() {
    if (filterBarIsOpen) {
      return DateRangeControl();
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
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
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
                            LocalizationUtil.translate(context, 'ApplicationAppBarTitle'),
                            style: TextStyle(
                                fontSize: 25,
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
                      // GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       searchBarIsOpen = !searchBarIsOpen;
                      //       if (searchBarIsOpen) {
                      //         filterBarIsOpen = false;
                      //         appBarHeight =
                      //             appBarInitializeValue + searchBarOpenHeight;
                      //       } else {
                      //         appBarHeight = appBarInitializeValue;
                      //       }
                      //     });
                      //   },
                      //   child: Icon(
                      //     Icons.search,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            searchBarIsOpen = false;
                            filterBarIsOpen=false;
                            appBarHeight = appBarInitializeValue;
                            context.read<EarthquakeFilterProvider>().setInitialValue();
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
                _getDateRange2(),
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
