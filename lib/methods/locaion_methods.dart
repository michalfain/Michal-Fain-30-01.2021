import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/types/error_data.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      return e;
    }
  }
}
