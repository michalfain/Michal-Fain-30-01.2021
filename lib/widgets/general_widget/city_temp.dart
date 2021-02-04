import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/types/data.dart';
import 'basic_widgets.dart';

class TitleTemp extends StatelessWidget {
  TitleTemp({this.data, this.onTap});

  final Data data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            StringText(
              text: data.city,
              style: TextStyle(color: Colors.black54, fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StringText(
                  text: data.temperature,
                  style: TextStyle(color: Colors.black54, fontSize: 16.0),
                ),
                degreeSymbol(),
              ],
            ),
            StringText(
              text: data.description,
              style: TextStyle(color: Colors.black54, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
