import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'basic_widgets.dart';

class DaysForecast extends StatefulWidget {
  DaysForecast({this.day, this.minTemp, this.maxTemp});

  final String day;
  final String minTemp;
  final String maxTemp;
  @override
  _DaysForecastState createState() => _DaysForecastState();
}

class _DaysForecastState extends State<DaysForecast> {
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
              text: widget.day,
              style: TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                StringText(
                  text: Constants.MIN_TEMP,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
                StringText(
                  text: widget.minTemp,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
              ],
            ),
            Row(
              children: [
                StringText(
                  text: Constants.MAX_TEMP,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
                StringText(
                  text: widget.maxTemp,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
