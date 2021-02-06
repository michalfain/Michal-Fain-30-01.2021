import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/methods/general_methods.dart';
import 'package:weather_app/types/data.dart';
import 'package:weather_app/types/error_data.dart';
import 'package:weather_app/widgets/general_widget/background_widget.dart';
import 'package:weather_app/widgets/general_widget/basic_widgets.dart';
import 'package:weather_app/widgets/home_widget/city_data.dart';
import 'package:weather_app/widgets/home_widget/favorite_button.dart';
import 'package:weather_app/widgets/home_widget/five_days_forecast.dart';
import 'package:weather_app/widgets/home_widget/get_weather_button.dart';
import 'package:weather_app/widgets/home_widget/search_field_widget.dart';

class Home extends StatefulWidget {
  Home(this.city, this.cityKey);
  final String cityKey;
  final String city;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GeneralMethods generalMethods = GeneralMethods();
  Data weatherData = Data();
  DataMethods dataMethods = DataMethods();
  bool isLoading = true;
  bool isDaysLoading = true;
  bool isPressed = false;
  bool isFavorite = false;
  TextEditingController cityController = TextEditingController();
  List<Data> fiveDaysData = [];

  void initState() {
    dataMethods.getTemperature(widget.city, widget.cityKey).then((value) {
      {
        setState(() {
          weatherData.key = value.key;
          weatherData.city = value.city;
          weatherData.temperature = value.temperature;
          weatherData.description = value.description;
          isLoading = false;
        });
      }
    });
    dataMethods.getFiveDaysForecast(widget.city).then((value) => {
          setState(() {
            isDaysLoading = false;
            fiveDaysData = value;
          })
        });
    super.initState();
  }

  addToFavorites(Data data) {
    if (data is ErrorData) {
      return createAlertDialog(context, Constants.ERROR);
    } else {
      generalMethods.setFavoriteCity(data.city);
      generalMethods.setFavoriteKey(data.key);
    }
    setState(() {
      isPressed = false;
    });
  }

  updateUI(String city) {
    if (city == null) {
      return createAlertDialog(context, Constants.ERROR);
    }
    {
      dataMethods.getData(city).then((key) {
        dataMethods.getTemperature(city, key.key).then((data) {
          dataMethods.getFiveDaysForecast(city).then((value) {
            setState(() {
              weatherData = data;
              fiveDaysData = value;
            });
          });
        });
      });
    }
    if (Constants.CITY_LIST.contains(city)) {
      setState(() {
        isFavorite = true;
      });
    }
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
            generalMethods.goToFavorite(context);
          },
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : BackgroundWidget(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchField(
                          controller: cityController,
                          onTap: () {
                            updateUI(cityController.text);
                            cityController.clear();
                            isPressed = true;
                          },
                        ),
                        isFavorite
                            ? StringText(
                                text: Constants.FAVORITE,
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 10.0,
                                ))
                            : SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CityData(
                              data: weatherData,
                            ),
                            Container(
                              child: !isPressed
                                  ? GetWeatherButton(
                                      onPress: () async {
                                        updateUI(cityController.text);
                                        setState(() {
                                          isPressed = true;
                                          cityController.clear();
                                        });
                                      },
                                    )
                                  : FavoriteButton(
                                      onPressed: () async {
                                        addToFavorites(weatherData);
                                        setState(() {
                                          isPressed = false;
                                        });
                                      },
                                    ),
                            ),
                          ],
                        ),
                        Center(
                          child: StringText(
                            text: weatherData.description,
                            style: TextStyle(color: Colors.black, fontSize: 30.0),
                          ),
                        ),
                        FiveDaysForecast(fiveDaysData), //todo: fix loading
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
