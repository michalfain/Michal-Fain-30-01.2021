import 'package:flutter/material.dart';
import 'package:weather_app/types/data.dart';
import 'city_temp.dart';

class CityData extends StatelessWidget {
  CityData({this.data});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_city,
              size: 50.0,
            ),
            TitleTemp(data: data),
          ],
        ),
      ),
    );
  }
}
