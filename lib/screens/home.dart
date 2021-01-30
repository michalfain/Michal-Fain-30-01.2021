import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/widgets/background_widget.dart';
import 'package:weather_app/widgets/basic_widgets.dart';
import 'package:weather_app/widgets/city_data.dart';
import 'package:weather_app/widgets/favorite_button.dart';
import 'package:weather_app/widgets/five_days_forecast.dart';

import 'favorites.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  goToFavorite() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoriteScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: StringText(text: Constants.WEATHER),
        ),
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            goToFavorite();
          },
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CityData(),
                  FavoriteButton(),
                ],
              ),
              Center(
                child: StringText(
                  text: Constants.SCATTERED_CLOUDS,
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
              ),
              FiveDaysForecast(),
            ],
          ),
        ),
      ),
    );
  }
}
