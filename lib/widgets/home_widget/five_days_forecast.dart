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
    int dayOfWeek = widget.fiveDays[0].firstDay - 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DaysForecast(
          day: Constants.DAYS_OF_WEEK[dayOfWeek],
          maxTemp: widget.fiveDays[0].maxTemp,
          minTemp: widget.fiveDays[0].minTemp,
        ),
        DaysForecast(
          day: dayOfWeek == 7 ? Constants.DAYS_OF_WEEK[0] : Constants.DAYS_OF_WEEK[dayOfWeek + 1],
          maxTemp: widget.fiveDays[1].maxTemp,
          minTemp: widget.fiveDays[1].minTemp,
        ),
        DaysForecast(
          day: dayOfWeek == 5 ? Constants.DAYS_OF_WEEK[1] : Constants.DAYS_OF_WEEK[dayOfWeek + 2],
          maxTemp: widget.fiveDays[2].maxTemp,
          minTemp: widget.fiveDays[2].minTemp,
        ),
        DaysForecast(
          day: dayOfWeek == 4 ? Constants.DAYS_OF_WEEK[2] : Constants.DAYS_OF_WEEK[dayOfWeek + 3],
          maxTemp: widget.fiveDays[3].maxTemp,
          minTemp: widget.fiveDays[3].minTemp,
        ),
        DaysForecast(
          day: dayOfWeek == 3 ? Constants.DAYS_OF_WEEK[3] : Constants.DAYS_OF_WEEK[dayOfWeek + 4],
          maxTemp: widget.fiveDays[4].maxTemp,
          minTemp: widget.fiveDays[4].minTemp,
        ),
      ],
    );
  }
}
