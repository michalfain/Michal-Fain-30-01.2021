import 'package:flutter/material.dart';
import 'basic_widgets.dart';

class TitleTemp extends StatelessWidget {
  TitleTemp({this.icon, this.title});
  final String title;
  final icon;
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
            text: '38C',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
