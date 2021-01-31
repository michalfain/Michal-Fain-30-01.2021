import 'package:http/http.dart' as http;

class DataMethods {
  void getData() async {
    http.Response response = await http.get(
        'http://dataservice.accuweather.com/currentconditions/v1/35315?apikey=1u9Be1cASaCvn8rSpfZbw3kcXpi1HzuS&language=en-us&details=true');
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode); //todo: handle exception
    }
  }
}
