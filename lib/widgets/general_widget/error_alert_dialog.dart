import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'basic_widgets.dart';

class ErrorAlertDialog extends StatelessWidget {
  ErrorAlertDialog({this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: StringText(text: Constants.ERROR),
      content: SingleChildScrollView(
        child: StringText(text: message),
      ),
      actions: <Widget>[
        BasicButton(
          child: StringText(),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
