import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/constants.dart';
import 'package:weather_app/types/data.dart';

const apiKey = Constants.API_KEY;
const apiKey2 = Constants.API_KEY_2;
const website = Constants.WEBSITE;

class DataMethods {
  String key;
  Future getData() async {
    http.Response response =
        await http.get('$website/locations/v1/cities/search?apikey=$apiKey2&q=tel%20aviv&language=en-us&details=true');
    if (response.statusCode == 200) {
      String body = response.body;
      var decodeData = jsonDecode(body);
      Data data = Data();
      data.key = decodeData[0]['Key'];
      key = data.key;
      data.city = decodeData[0]['EnglishName'];
      print(data.key);
      return data;
    } else {
      print(response.statusCode); //todo: handle exception
    }
  }

  Future getTemperature() async {
    Data returnedKey = await getData();
    http.Response response =
        await http.get('$website/currentconditions/v1/${returnedKey.key}?apikey=$apiKey2&language=en-us');
    if (response.statusCode == 200) {
      String body = response.body;
      var decodeData = jsonDecode(body);
      Data data = Data();
      data.temperature = decodeData[0]['Temperature']['Metric']['Value'].toString();
      data.description = decodeData[0]['WeatherText'];
      return data;
    } else {
      print(response.statusCode); //todo: handle exception
    }
  }
}
