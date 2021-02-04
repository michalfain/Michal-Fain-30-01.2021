import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/methods/general_methods.dart';
import 'package:weather_app/types/data.dart';
import 'package:weather_app/widgets/general_widget/background_widget.dart';
import 'package:weather_app/widgets/general_widget/basic_widgets.dart';
import 'package:weather_app/widgets/home_widget/city_data.dart';
import 'package:weather_app/widgets/home_widget/favorite_button.dart';
import 'package:weather_app/widgets/home_widget/five_days_forecast.dart';
import 'package:weather_app/widgets/home_widget/get_weather_button.dart';
import 'package:weather_app/widgets/home_widget/search_field_widget.dart';

class Home extends StatefulWidget {
  Home(this.cityKey, this.city);
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
  TextEditingController cityController = TextEditingController();
  SnackBar snackBar = SnackBar(
    content: StringText(text: 'hi'), //todo: handle snackbar
  );
  List<Data> fiveDaysData = [];

  void initState() {
    dataMethods.getTemperature(widget.cityKey, widget.city).then((value) {
      {
        setState(() {
          isLoading = false;
          weatherData.key = value.key;
          weatherData.city = value.city;
          weatherData.temperature = value.temperature;
          weatherData.description = value.description;
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

  updateUI(String city) async {
    if (city != null) {
      Data d = await dataMethods.getData(city);
      dataMethods.getTemperature(d.key, d.city);
      List newFiveDays = await dataMethods.getFiveDaysForecast(d.city);
      setState(() {
        weatherData.key = d.key;
        weatherData.city = d.city;
        weatherData.temperature = d.temperature;
        weatherData.description = d.description;
        fiveDaysData = newFiveDays;
        isPressed = true;
      });
    }
  }

  addToFavorites(Data data) {
    setState(() {
      if (data != null) {
        Data d = Data();
        d.city = data.city;
        d.key = data.key;
        d.temperature = data.temperature;
        d.description = data.description;
        Constants.FAVORITE_CITY_LIST.add(d);
        isPressed = false;
      }
    });
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
            : Builder(
                builder: (context) {
                  return BackgroundWidget(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SearchField(
                            controller: cityController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CityData(
                                data: weatherData,
                              ),
                              Container(
                                child: !isPressed
                                    ? GetWeatherButton(
                                        onPress: updateUI(cityController.text),
                                      )
                                    : FavoriteButton(
                                        onPress: addToFavorites(weatherData),
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
                  );
                },
              ));
  }
}
