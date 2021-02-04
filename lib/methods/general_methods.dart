import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/screens/favorites.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/types/data.dart';

class GeneralMethods {
  DataMethods dataMethods = DataMethods();
  getFiveDaysForecast(BuildContext context, String cityKey, String city) async {
    DataMethods dataMethods = DataMethods();
    Data d = await dataMethods.getTemperature(cityKey, city);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Home(d.key, d.city),
      ),
    );
  }

  onSearch(String query) async {
    List<Data> searchedCities = await dataMethods.searchCity(query);
    return searchedCities;
  }

  goToFavorite(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoriteScreen(),
      ),
    );
  }
}
