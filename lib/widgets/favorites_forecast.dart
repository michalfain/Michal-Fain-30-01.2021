import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/screens/home.dart';
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
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Home(Constants.TEL_AVIV_CITY_KEY, Constants.TEL_AVIV),
                ),
              );
            },
            child: TitleTemp(
              title: 'Tel Aviv',
              temperature: '18',
              description: 'Clear',
              cityKey: Constants.TEL_AVIV_CITY_KEY,
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home('213225', 'Jerusalem'),
                  ),
                );
              },
              child: TitleTemp(title: 'Jerusalem', temperature: '18', description: 'Clear', cityKey: '213225')),
          TitleTemp(
            title: 'London',
            temperature: '18',
            description: 'Clear',
            cityKey: '328328',
          ),
          TitleTemp(
            title: 'Berlin',
            temperature: '18',
            description: 'Clear',
            cityKey: '178087',
          ),
          TitleTemp(
            title: 'Rome',
            temperature: '18',
            description: 'Clear',
            cityKey: '213490',
          ),
        ],
      ),
    );
  }
}
