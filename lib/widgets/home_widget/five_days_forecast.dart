import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/types/data.dart';
import 'days_forecast.dart';

class FiveDaysForecast extends StatefulWidget {
  FiveDaysForecast(this.fiveDays);
  final List<Data> fiveDays;
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
          day: Constants.DAYS_OF_WEEK[widget.fiveDays[0].firstDay],
          maxTemp: widget.fiveDays[0].maxTemp,
          minTemp: widget.fiveDays[0].minTemp,
        ),
        DaysForecast(
          day: Constants.DAYS_OF_WEEK[widget.fiveDays[1].firstDay],
          maxTemp: widget.fiveDays[1].maxTemp,
          minTemp: widget.fiveDays[1].minTemp,
        ),
        DaysForecast(
          day: Constants.DAYS_OF_WEEK[widget.fiveDays[2].firstDay],
          maxTemp: widget.fiveDays[2].maxTemp,
          minTemp: widget.fiveDays[2].minTemp,
        ),
        DaysForecast(
          day: Constants.DAYS_OF_WEEK[widget.fiveDays[3].firstDay],
          maxTemp: widget.fiveDays[3].maxTemp,
          minTemp: widget.fiveDays[3].minTemp,
        ),
        DaysForecast(
          day: Constants.DAYS_OF_WEEK[widget.fiveDays[4].firstDay],
          maxTemp: widget.fiveDays[4].maxTemp,
          minTemp: widget.fiveDays[4].minTemp,
        ),
      ],
    );
  }
}
