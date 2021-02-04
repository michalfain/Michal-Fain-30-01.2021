import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants.dart';
import 'package:weather_app/types/data.dart';

//const apiKey = Constants.API_KEY;
//const apiKey = Constants.API_KEY_2;
//const apiKey = Constants.API_KEY_3;
const apiKey = Constants.API_KEY_4;
const website = Constants.WEBSITE;

class DataMethods {
  Future getData(String city) async {
    http.Response response =
        await http.get('$website/locations/v1/cities/search?apikey=$apiKey&q=$city&language=en-us&details=true');
    try {
      if (response.statusCode == 200) {
        String body = response.body;
        var decodeData = jsonDecode(body);
        Data data = Data();
        data.key = decodeData[0]['Key'];
        data.city = decodeData[0]['EnglishName'];
        return data;
      } else {
        print(response.statusCode); //todo: handle exception
      }
    } catch (e) {
      return e;
    }
  }

  Future getTemperature(String key, String newCity) async {
    Data returnedData = await getData(newCity);
    http.Response response = await http.get('$website/currentconditions/v1/$key?apikey=$apiKey&language=en-us');
    try {
      if (response.statusCode == 200) {
        String body = response.body;
        var decodeData = jsonDecode(body);
        Data data = Data();
        data.temperature = decodeData[0]['Temperature']['Metric']['Value'].toString();
        data.description = decodeData[0]['WeatherText'];
        data.city = returnedData.city;
        data.key = returnedData.key;
        return data;
      } else {
        print(response.statusCode); //todo: handle exception
      }
    } catch (e) {
      return e;
    }
  }

  Future getFiveDaysForecast(String fiveDaysCity) async {
    Data returnedKey = await getData(fiveDaysCity);
    http.Response response = await http.get(
        '$website/forecasts/v1/daily/5day/${returnedKey.key}?apikey=$apiKey&language=en-us&details=true&metric=true');
    try {
      if (response.statusCode == 200) {
        DateTime date = DateTime.now();
        int newDateFormat = date.weekday;
        String body = response.body;
        var decodeData = jsonDecode(body);
        List<Data> fiveDaysData = List();
        for (int i = 0; i < 5; i++) {
          Data d = Data();
          d.minTemp = decodeData['DailyForecasts'][i]['Temperature']['Minimum']['Value'].toString();
          d.maxTemp = decodeData['DailyForecasts'][i]['Temperature']['Maximum']['Value'].toString();
          d.firstDay = newDateFormat;
          fiveDaysData.add(d);
        }
        return fiveDaysData;
      } else {
        print(response.statusCode); //todo: handle exception
      }
    } catch (e) {
      return e;
    }
  }

  Future searchCity(String search) async {
    http.Response response =
        await http.get('$website/locations/v1/cities/autocomplete?apikey=$apiKey&q=$search&language=en-us');
    try {
      if (response.statusCode == 200) {
        String body = response.body;
        var decodeData = jsonDecode(body);
        List<Data> searchCity = List();
        for (int i = 0; i < decodeData.length; i++) {
          Data d = Data();
          d.key = decodeData[i]['Key'];
          d.city = decodeData[i]['LocalizedName'];
          searchCity.add(d);
          print(searchCity[i].city);
          print(searchCity[i].key);
        }
        return searchCity;
      } else {
        print(response.statusCode); //todo: handle exception

      }
    } catch (e) {
      print(e);
    }
  }
}
