import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/methods/general_methods.dart';
import 'package:weather_app/types/data.dart';
import 'package:weather_app/widgets/general_widget/basic_widgets.dart';

class SearchField extends StatefulWidget {
  SearchField({this.controller, this.onTap});
  final TextEditingController controller;
  final Function onTap;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  DataMethods dataMethods = DataMethods();
  GeneralMethods generalMethods = GeneralMethods();
  List<Data> searchedCities;

  updateList(List citiesList) {
    setState(() {
      searchedCities = citiesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.left,
              controller: widget.controller,
              onChanged: (value) {
                dataMethods.searchCity(widget.controller.text).then((value) => {
                      searchedCities = value,
                      updateList(searchedCities),
                    });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                prefixIcon: Icon(Icons.location_city),
                hintText: Constants.SEARCH_HERE,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            widget.controller.text.isEmpty
                ? SizedBox()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchedCities.length,
                    itemBuilder: (context, i) {
                      return searchContainer(
                          text: searchedCities[i].city,
                          onTap: () {
                            setState(() {
                              widget.controller.text = searchedCities[i].city;
                            });
                          });
                    },
                  )
          ],
        ),
      ),
    );
  }
}
