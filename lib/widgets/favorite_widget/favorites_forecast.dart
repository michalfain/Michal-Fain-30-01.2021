import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/methods/general_methods.dart';
import 'package:weather_app/types/data.dart';
import '../general_widget/city_temp.dart';

class FavoritesForecast extends StatefulWidget {
  @override
  _FavoritesForecastState createState() => _FavoritesForecastState();
}

class _FavoritesForecastState extends State<FavoritesForecast> {
  GeneralMethods generalMethods = GeneralMethods();
  DataMethods dataMethods = DataMethods();

  @override
  void initState() {
    Constants.FAVORITE_CITY_LIST.clear();
    Constants.FAVORITE_CITY_LIST = generalMethods.getFavoriteList();
    super.initState();
  }

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
                generalMethods.getFiveDaysForecast(context, fav.city);
              },
            );
          }),
    );
  }
}
