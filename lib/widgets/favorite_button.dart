import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

import 'basic_widgets.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  addToFavorites() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            isFavorite ? Icons.favorite_border : Icons.favorite,
            color: Colors.pink,
            size: 35.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          BasicButton(
              color: Colors.white70,
              onPress: () {
                addToFavorites();
              },
              title: isFavorite ? Constants.REMOVE_FROM_FAVORITES : Constants.ADD_TO_FAVORITES),
        ],
      ),
    );
  }
}
