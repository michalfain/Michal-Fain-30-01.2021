import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/types/data.dart';
import 'package:weather_app/widgets/background_widget.dart';
import 'package:weather_app/widgets/basic_widgets.dart';
import 'package:weather_app/widgets/city_data.dart';
import 'package:weather_app/widgets/error_snack_bar.dart';
import 'package:weather_app/widgets/favorite_button.dart';
import 'package:weather_app/widgets/five_days_forecast.dart';
import 'package:weather_app/widgets/search_field_widget.dart';
import 'favorites.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String city;
  String temperature;
  String description;
  String key;
  Data weatherData;
  DataMethods dataMethods = DataMethods();
  bool isLoading = true;
  SnackBar snackBar = SnackBar(
    content: StringText(text: 'hi'), //todo: handle snackbar
  );

  void initState() {
    dataMethods.getTemperature().then((value) {
      {
        temperature = value.temperature;
        description = value.description;
        if (temperature != null && description != null) {
          setState(() {
            isLoading = false;
          });
        }
      }
    });
//    dataMethods.getFiveDaysForecast();
    super.initState();
  }

  goToFavorite() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoriteScreen(),
      ),
    );
  }

  showSnackBar() {
    Scaffold.of(context).showSnackBar(snackBar);
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
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Builder(
                builder: (context) {
                  return BackgroundWidget(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
//                          BasicButton(
//                            onPress: () {},
//                            title: Constants.GET_CURRENT_LOCATION,
//                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CityData(temperature),
                              FavoriteButton(),
                            ],
                          ),
                          Center(
                            child: StringText(
                              text: description,
                              style: TextStyle(color: Colors.black, fontSize: 30.0),
                            ),
                          ),
                          FiveDaysForecast(),
                          SearchField(),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
