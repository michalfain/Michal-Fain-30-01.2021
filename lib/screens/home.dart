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
  String temperature; //todo: make object of the parameters
  String description;
  String key;
  String city;
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
        key = value.key ?? 'unavailable';
        city = value.city ?? 'unavailable';
        temperature = value.temperature ?? 'unavailable';
        description = value.description ?? 'unavailable';
        setState(() {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CityData(city: city, temperature: temperature),
                              FavoriteButton(),
                            ],
                          ),
                          Center(
                            child: StringText(
                              text: description,
                              style: TextStyle(color: Colors.black, fontSize: 30.0),
                            ),
                          ),
                          FiveDaysForecast(fiveDaysData), //todo: fix loading
                          SearchField(),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
