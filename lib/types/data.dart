import 'package:weather_app/types/error_data.dart';

class Data {
  String key;
  String city;
  String temperature;
  String description;
  int firstDay;
  String minTemp;
  String maxTemp;
  ErrorData errorData;

  Data({
    this.key = '',
    this.city = '',
    this.temperature = '',
    this.description = '',
    this.firstDay = -1,
    this.minTemp = '',
    this.maxTemp = '',
    this.errorData,
  });
}
