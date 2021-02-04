import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import '../general_widget/basic_widgets.dart';

class FavoriteButton extends StatelessWidget {
  FavoriteButton({this.onPress, this.text});
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BasicButton(
          child: Icon(
            Icons.favorite_border,
            color: Colors.pink,
            size: 20.0,
          ),
          color: Colors.white70,
          onPress: onPress,
          title: Constants.ADD_TO_FAVORITES),
    );
  }
}
