import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/types/data.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String cityName;
  List<Data> searchedCities = [];
  TextEditingController controller = TextEditingController();

  onSearch(String query) async {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            cityName = value;
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
      ),
    );
  }
}
