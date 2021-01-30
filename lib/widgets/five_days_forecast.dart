import 'package:flutter/material.dart';
import 'city_temp.dart';

class FiveDaysForecast extends StatefulWidget {
  @override
  _FiveDaysForecastState createState() => _FiveDaysForecastState();
}

class _FiveDaysForecastState extends State<FiveDaysForecast> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleTemp(title: 'Sun'),
        TitleTemp(title: 'Mon'),
        TitleTemp(title: 'Tue'),
        TitleTemp(title: 'Wed'),
        TitleTemp(title: 'Thu'),
      ],
    );
  }
}
