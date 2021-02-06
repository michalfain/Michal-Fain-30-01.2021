import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/screens/favorites.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/types/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralMethods {
  DataMethods dataMethods = DataMethods();

  getFiveDaysForecast(BuildContext context, String city) async {
    DataMethods dataMethods = DataMethods();
    Data d = await dataMethods.getData(city);
    goToHomePage(context, d.city);
  }

  goToHomePage(BuildContext context, String city) async {
    Data data = await dataMethods.getData(city);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Home(city, data.key),
      ),
    );
  }

  onSearch(String query, List<Data> searchedCities) async {
    searchedCities = await dataMethods.searchCity(query);
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

  setFavoriteCity(String city) async {
    Constants.CITY_LIST.add(city);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(Constants.FAVORITE_LIST_CITY, Constants.CITY_LIST);
  }

  getFavoriteCity() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List city = preferences.getStringList(Constants.FAVORITE_LIST_CITY);
    print(Constants.CITY_LIST);
    return city;
  }

  setFavoriteKey(String key) async {
    Constants.KEY_LIST.add(key);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(Constants.FAVORITE_LIST_KEY, Constants.KEY_LIST);
  }

  getFavoriteKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List key = preferences.getStringList(Constants.FAVORITE_LIST_KEY);
    print(Constants.KEY_LIST);
    return key;
  }

  getFavoriteList() {
    getFavoriteKey();
    getFavoriteCity();
    for (int i = 0; i < Constants.CITY_LIST.length; i++) {
      Data d = Data();
      d.city = Constants.CITY_LIST[i];
      d.key = Constants.KEY_LIST[i];
      Constants.FAVORITE_CITY_LIST.add(d);
    }
    return Constants.FAVORITE_CITY_LIST;
  }
}
