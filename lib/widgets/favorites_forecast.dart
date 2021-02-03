import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/screens/home.dart';
import 'city_temp.dart';

class FavoritesForecast extends StatelessWidget {
  getFiveDaysForecast(BuildContext context, String cityKey, String city) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Home(cityKey, city),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //todo: clean code
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: Constants.FAVORITE_CITY_LIST.length,
          itemBuilder: (context, i) {
            final fav = Constants.FAVORITE_CITY_LIST[i];
            return TitleTemp(
              data: fav,
              onTap: () {
                getFiveDaysForecast(context, fav.key, fav.city);
              },
            );
          }),
    );
  }
}
