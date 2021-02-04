import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import '../general_widget/basic_widgets.dart';

class GetWeatherButton extends StatelessWidget {
  GetWeatherButton({this.onPress, this.text});
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BasicButton(
          child: Icon(
            Icons.location_city,
            size: 20.0,
          ),
          color: Colors.white70,
          onPress: onPress,
          title: Constants.GET_WEATHER),
    );
  }
}
