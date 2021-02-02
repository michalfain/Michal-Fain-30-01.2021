import 'package:flutter/material.dart';

import '../constants.dart';

class StringText extends StatelessWidget {
  StringText({this.text, this.style});
  final String text;
  final style;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style ?? TextStyle(color: Colors.white70));
  }
}

Widget degreeSymbol() {
  return StringText(
    text: Constants.DEGREE_SYMBOL,
    style: TextStyle(color: Colors.black54, fontSize: 16.0),
  );
}

class BasicButton extends StatelessWidget {
  BasicButton({this.onPress, this.title, this.color});
  final Function onPress;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: onPress,
      child: StringText(
        text: title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
