import 'package:flutter/material.dart';
import 'city_temp.dart';

class FavoritesForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleTemp(title: 'Tel Aviv', temperature: '18', description: 'Clear'),
          TitleTemp(title: 'Tel Aviv', temperature: '18', description: 'Clear'),
          TitleTemp(title: 'Tel Aviv', temperature: '18', description: 'Clear'),
          TitleTemp(title: 'Tel Aviv', temperature: '18', description: 'Clear'),
          TitleTemp(title: 'Tel Aviv', temperature: '18', description: 'Clear'),
          TitleTemp(title: 'Tel Aviv', temperature: '18', description: 'Clear'),
        ],
      ),
    );
  }
}
