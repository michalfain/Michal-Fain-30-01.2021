import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/general_methods.dart';
import '../general_widget/city_temp.dart';

class FavoritesForecast extends StatelessWidget {
  final GeneralMethods generalMethods = GeneralMethods();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: Constants.FAVORITE_CITY_LIST.length,
          itemBuilder: (context, i) {
            final fav = Constants.FAVORITE_CITY_LIST[i];
            return TitleTemp(
              data: fav,
              onTap: () {
                generalMethods.getFiveDaysForecast(context, fav.key, fav.city);
              },
            );
          }),
    );
  }
}
