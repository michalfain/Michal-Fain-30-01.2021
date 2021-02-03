import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/methods/data_methods.dart';
import 'package:weather_app/types/data.dart';
import 'package:weather_app/widgets/background_widget.dart';
import 'package:weather_app/widgets/basic_widgets.dart';
import 'package:weather_app/widgets/city_data.dart';
import 'package:weather_app/widgets/favorite_button.dart';
import 'package:weather_app/widgets/five_days_forecast.dart';
import 'package:weather_app/widgets/search_field_widget.dart';
import 'favorites.dart';

class Home extends StatefulWidget {
  Home(this.cityKey, this.city);
  final String cityKey;
  final String city;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data weatherData = Data();
  DataMethods dataMethods = DataMethods();
  bool isLoading = true;
  bool isDaysLoading = true;
  SnackBar snackBar = SnackBar(
    content: StringText(text: 'hi'), //todo: handle snackbar
  );
  List<Data> fiveDaysData = [];

  void initState() {
    dataMethods.getTemperature(widget.cityKey, widget.city).then((value) {
      {
        setState(() {
          isLoading = false;
          weatherData.key = value.key ?? 'unavailable';
          weatherData.city = value.city ?? 'unavailable';
          weatherData.temperature = value.temperature ?? 'unavailable';
          weatherData.description = value.description ?? 'unavailable';
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
                          SearchField(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CityData(
                                data: weatherData,
                              ),
                              FavoriteButton(),
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
