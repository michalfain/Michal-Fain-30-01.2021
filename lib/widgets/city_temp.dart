import 'package:flutter/material.dart';
import 'basic_widgets.dart';

class TitleTemp extends StatelessWidget {
  TitleTemp({this.description, this.title, this.temperature});
  final String title;
  final String temperature;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          StringText(
            text: title,
            style: TextStyle(color: Colors.black54, fontSize: 20.0),
          ),
          StringText(
            text: temperature,
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
