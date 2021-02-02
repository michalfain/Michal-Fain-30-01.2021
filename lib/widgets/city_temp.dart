import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home.dart';
import '../constants.dart';
import 'basic_widgets.dart';

class TitleTemp extends StatelessWidget {
  TitleTemp({this.description, this.title, this.temperature, this.cityKey});
  final String title;
  final String temperature;
  final String description;
  final String cityKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          StringText(
            text: title,
            style: TextStyle(color: Colors.black54, fontSize: 20.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StringText(
                text: temperature,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
              ),
              degreeSymbol(),
            ],
          ),
//          StringText(
//            text: description,
//            style: TextStyle(color: Colors.black54, fontSize: 16.0),
//          ),
        ],
      ),
    );
  }
}
