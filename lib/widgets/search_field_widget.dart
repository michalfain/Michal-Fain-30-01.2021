import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/types/data.dart';
import 'package:weather_app/widgets/basic_widgets.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  DataMethods dataMethods = DataMethods();
  List<Data> searchedCities = [];
  TextEditingController controller = TextEditingController();

  onSearch(String query) async {
    searchedCities = await dataMethods.searchCity(query);
    return searchedCities;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
//            searchedCities == null
//                ?
            TextField(
              controller: controller,
              onChanged: onSearch,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                prefixIcon: Icon(Icons.location_city),
                hintText: Constants.SEARCH_HERE,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            )
//                : ListView.builder(
//                    itemCount: searchedCities.length,
//                    itemBuilder: (context, i) {
//                      final item = searchedCities[i];
//                      return Container(
//                        child: StringText(
//                          text: item.city,
//                        ),
//                      );
//                    },
//                  ),
          ],
        ),
      ),
    );
  }
}
