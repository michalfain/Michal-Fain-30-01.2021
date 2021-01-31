import 'package:flutter/material.dart';
import 'city_temp.dart';

class FavoritesForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TitleTemp(title: 'Tel Aviv', icon: Icons.wb_sunny),
        TitleTemp(title: 'Tel Aviv', icon: Icons.wb_sunny),
        TitleTemp(title: 'Tel Aviv', icon: Icons.wb_sunny),
        TitleTemp(title: 'Tel Aviv', icon: Icons.wb_sunny),
        TitleTemp(title: 'Tel Aviv', icon: Icons.wb_sunny),
        TitleTemp(title: 'Tel Aviv', icon: Icons.wb_sunny),
      ],
    );
  }
}
