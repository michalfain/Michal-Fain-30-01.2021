import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/methods/general_methods.dart';
import 'package:weather_app/types/data.dart';

class SearchField extends StatelessWidget {
  SearchField({this.controller});
  final TextEditingController controller;
//
//  DataMethods dataMethods = DataMethods();
//  GeneralMethods generalMethods = GeneralMethods();
//  List<Data> searchedCities = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.left,
              controller: controller,
//              onChanged: widget.onChanged,
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
//            ListView.builder(
//              itemCount: searchedCities.length,
//              itemBuilder: (context, i) {
//                return Text(searchedCities[i].city);
////                  searchContainer(
////                  searchedCities[i].city,
////                  generalMethods.getFiveDaysForecast(
////                    context,
////                    searchedCities[i].key,
////                    searchedCities[i].city,
////                  ),
////                );
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
