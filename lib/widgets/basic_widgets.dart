import 'package:flutter/material.dart';

class StringText extends StatelessWidget {
  StringText({this.text, this.style});
  final String text;
  final style;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style ?? TextStyle(color: Colors.white70));
  }
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
