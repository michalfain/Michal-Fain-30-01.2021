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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
//          TitleTemp(
//            onTap: () {
//              getFiveDaysForecast(context, Constants.TEL_AVIV_CITY_KEY, Constants.TEL_AVIV);
//            },
//            title: 'Tel Aviv',
//            temperature: '18',
//            description: 'Clear',
//            cityKey: Constants.TEL_AVIV_CITY_KEY,
//          ),
//          TitleTemp(
////            onTap: getFiveDaysForecast(context, '213225', 'Jerusalem'),
//            title: 'Jerusalem',
//            temperature: '18',
//            description: 'Clear',
//            cityKey: '213225',
//          ),
//          TitleTemp(
////            onTap: getFiveDaysForecast(context, '328328', 'London'),
//            title: 'London',
//            temperature: '18',
//            description: 'Clear',
//            cityKey: '328328',
//          ),
//          TitleTemp(
////            onTap: getFiveDaysForecast(context, '178087', 'Berlin'),
//            title: 'Berlin',
//            temperature: '18',
//            description: 'Clear',
//            cityKey: '178087',
//          ),
        ],
      ),
    );
  }
}
