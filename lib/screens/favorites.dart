import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/widgets/favorite_widget/favorites_forecast.dart';
import 'package:weather_app/widgets/general_widget/background_widget.dart';
import 'package:weather_app/widgets/general_widget/basic_widgets.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: StringText(
            text: Constants.MY_FAVORITES,
          ),
        ),
      ),
      body: BackgroundWidget(
        child: FavoritesForecast(),
      ),
    );
  }
}
