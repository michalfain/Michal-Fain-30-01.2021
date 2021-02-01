import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'city_temp.dart';

class CityData extends StatefulWidget {
  CityData(this.temperature);
  final String temperature;
  @override
  _CityDataState createState() => _CityDataState();
}

class _CityDataState extends State<CityData> {
  DataMethods dataMethods = DataMethods();
  @override
  void initState() {
    dataMethods.getTemperature();
    super.initState();
  }

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
            TitleTemp(title: Constants.TEL_AVIV, temperature: widget.temperature),
          ],
        ),
      ),
    );
  }
}
