import 'package:flutter/material.dart';
import 'package:weather_app/widgets/basic_widgets.dart';

class ErrorSnackBar extends StatefulWidget {
  @override
  _ErrorSnackBarState createState() => _ErrorSnackBarState();
}

class _ErrorSnackBarState extends State<ErrorSnackBar> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: StringText(
      text: 'hi',
    ));
  }
}
