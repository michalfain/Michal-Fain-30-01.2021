import 'package:flutter/material.dart';

import 'basic_widgets.dart';

class DaysForecast extends StatelessWidget {
  DaysForecast({this.day, this.minTemp, this.maxTemp});

  final String day;
  final String minTemp;
  final String maxTemp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            StringText(
              text: day,
              style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                StringText(
                  text: minTemp,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
                degreeSymbol(),
              ],
            ),
            Row(
              children: [
                StringText(
                  text: maxTemp,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
                degreeSymbol(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
