import 'package:flutter/material.dart';
import 'days_forecast.dart';

class FiveDaysForecast extends StatefulWidget {
  @override
  _FiveDaysForecastState createState() => _FiveDaysForecastState();
}

class _FiveDaysForecastState extends State<FiveDaysForecast> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DaysForecast(
          day: 'SUN',
          maxTemp: '13',
          minTemp: '15',
        ),
        DaysForecast(
          day: 'SUN',
          maxTemp: '13',
          minTemp: '15',
        ),
        DaysForecast(
          day: 'SUN',
          maxTemp: '13',
          minTemp: '15',
        ),
        DaysForecast(
          day: 'SUN',
          maxTemp: '13',
          minTemp: '15',
        ),
        DaysForecast(
          day: 'SUN',
          maxTemp: '13',
          minTemp: '15',
        ),
      ],
    );
  }
}
