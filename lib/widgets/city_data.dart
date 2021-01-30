import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'city_temp.dart';

class CityData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.location_city,
              size: 60.0,
            ),
            TitleTemp(title: Constants.TEL_AVIV),
          ],
        ),
      ),
    );
  }
}
