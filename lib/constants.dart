import 'package:weather_app/types/data.dart';

class Constants {
  static const WEATHER = 'Weather';
  static const TEL_AVIV = 'Tel Aviv';
  static const TEL_AVIV_CITY_KEY = '215854';
  static const ADD_TO_FAVORITES = 'Add to Favorites';
  static const REMOVE_FROM_FAVORITES = 'Remove';
  static const SCATTERED_CLOUDS = 'Scattered Clouds';
  static const MY_FAVORITES = 'My Favorites';
  static const GET_CURRENT_LOCATION = 'Get Current Location';
  static const SEARCH_HERE = 'Search Here';
  static const API_KEY = '1u9Be1cASaCvn8rSpfZbw3kcXpi1HzuS';
  static const API_KEY_2 = 'Pw8KFxNBwil5aR34yaU4GpgtY4Z3TPFC';
  static const API_KEY_3 = 'm7jyXFajzAcyiyTDdYUNvKq1MahgtFTy';
  static const API_KEY_4 = 'NLIItAgy2G3MwPAkZH9r3LEnP6SfHpb2';
  static const WEBSITE = 'http://dataservice.accuweather.com';
  static const MIN_TEMP = 'Min ';
  static const MAX_TEMP = 'Max ';
  static const DEGREE_SYMBOL = '°';
  static const List<String> DAYS_OF_WEEK = ['MON', 'TUE', 'WED', 'THI', 'FRI', 'SUT', 'SUN'];
  // ignore: non_constant_identifier_names
  static List<Data> FAVORITE_CITY_LIST = [
    Data(key: TEL_AVIV_CITY_KEY, city: TEL_AVIV),
    Data(key: '213225', city: 'Jerusalem'),
    Data(key: '328328', city: 'London'),
    Data(key: '178087', city: 'Berlin')
  ];
}
