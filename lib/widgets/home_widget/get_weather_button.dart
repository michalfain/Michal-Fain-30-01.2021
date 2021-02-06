import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import '../general_widget/basic_widgets.dart';

class GetWeatherButton extends StatefulWidget {
  GetWeatherButton({this.onPress, this.text});
  final Function onPress;
  final String text;

  @override
  _GetWeatherButtonState createState() => _GetWeatherButtonState();
}

class _GetWeatherButtonState extends State<GetWeatherButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BasicButton(
          onPressed: widget.onPress,
          child: Icon(
            Icons.location_city,
            size: 20.0,
          ),
          color: Colors.white70,
          title: Constants.GET_WEATHER),
    );
  }
}
