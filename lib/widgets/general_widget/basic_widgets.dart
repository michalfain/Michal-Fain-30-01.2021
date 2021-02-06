import 'package:flutter/material.dart';
import '../../constants.dart';

class StringText extends StatelessWidget {
  StringText({this.text, this.style});
  final String text;
  final style;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style ?? TextStyle(color: Colors.white70));
  }
}

Widget searchContainer({String text, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      child: StringText(
        text: text,
        style: TextStyle(fontSize: 30.0),
      ),
    ),
  );
}

Widget degreeSymbol() {
  return StringText(
    text: Constants.DEGREE_SYMBOL,
    style: TextStyle(color: Colors.black54, fontSize: 16.0),
  );
}

class BasicButton extends StatelessWidget {
  BasicButton({this.onPressed, this.title, this.color, this.child});
  final Function onPressed;
  final String title;
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          child,
          StringText(
            text: title,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

createAlertDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: StringText(text: Constants.ERROR),
          content: SingleChildScrollView(
            child: StringText(
              text: message,
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: <Widget>[
            Center(
              child: RaisedButton(
                child: Text(Constants.OK),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      });
}
