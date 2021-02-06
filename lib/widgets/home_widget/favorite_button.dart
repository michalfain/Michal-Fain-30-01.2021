import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import '../general_widget/basic_widgets.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton({this.onPressed, this.text});
  final Function onPressed;
  final String text;

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BasicButton(
        child: Icon(
          Icons.favorite_border,
          color: Colors.pink,
          size: 20.0,
        ),
        color: Colors.white70,
        onPressed: widget.onPressed,
        title: Constants.ADD_TO_FAVORITES,
      ),
    );
  }
}
