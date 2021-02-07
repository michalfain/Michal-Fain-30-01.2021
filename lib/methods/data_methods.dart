import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants.dart';
import 'package:weather_app/types/data.dart';
import 'package:weather_app/types/error_data.dart';
import 'package:weather_app/widgets/general_widget/basic_widgets.dart';
import 'package:weather_app/widgets/general_widget/error_alert_dialog.dart';

const apiKey = Constants.API_KEY;
//const apiKey = Constants.API_KEY_2;
//const apiKey = Constants.API_KEY_3;
//const apiKey = Constants.API_KEY_4;
//const apiKey = Constants.API_KEY_5;
//const apiKey = Constants.API_KEY_6;
//const apiKey = Constants.API_KEY_7;
const website = Constants.WEBSITE;

class DataMethods {
  Future getData(String city) async {
    Data data = Data();
    http.Response response =
        await http.get('$website/locations/v1/cities/search?apikey=$apiKey&q=$city&language=en-us&details=true');
    try {
      if (response.statusCode == 200) {
        String body = response.body;
        var decodeData = jsonDecode(body);
        data.key = decodeData[0]['Key'];
        data.city = decodeData[0]['EnglishName'];
      } else {
        data.errorData = ErrorData(response.statusCode, Constants.ERROR);
      }
      return data;
    } catch (e) {
      ErrorData error = ErrorData(response.statusCode, e.toString());
      data.errorData = error;
      return data;
    }
  }

//  Future getData(String city) async {
//    String body =
//        '[{"Version":1,"Key":"215854","Type":"City","Rank":31,"LocalizedName":"Tel Aviv","EnglishName":"Tel Aviv","PrimaryPostalCode":"","Region":{"ID":"MEA","LocalizedName":"Middle East","EnglishName":"Middle East"},"Country":{"ID":"IL","LocalizedName":"Israel","EnglishName":"Israel"},"AdministrativeArea":{"ID":"TA","LocalizedName":"Tel Aviv","EnglishName":"Tel Aviv","Level":1,"LocalizedType":"District","EnglishType":"District","CountryID":"IL"},"TimeZone":{"Code":"IST","Name":"Asia/Jerusalem","GmtOffset":2.0,"IsDaylightSaving":false,"NextOffsetChange":"2021-03-26T00:00:00Z"},"GeoPosition":{"Latitude":32.045,"Longitude":34.77,"Elevation":{"Metric":{"Value":34.0,"Unit":"m","UnitType":5},"Imperial":{"Value":111.0,"Unit":"ft","UnitType":0}}},"IsAlias":false,"SupplementalAdminAreas":[],"DataSets":["AirQualityCurrentConditions","AirQualityForecasts","Alerts","ForecastConfidence"],"Details":{"Key":"215854","StationCode":"TVAV","StationGmtOffset":2.0,"BandMap":"IS","Climo":"LLSD","LocalRadar":"","MediaRegion":null,"Metar":"LLSD","NXMetro":"","NXState":"","Population":371400,"PrimaryWarningCountyCode":"","PrimaryWarningZoneCode":"","Satellite":"MIDE","Synoptic":"40179","MarineStation":"","MarineStationGMTOffset":null,"VideoCode":"","LocationStem":"il/tel-aviv/215854","PartnerID":null,"Sources":[{"DataType":"AirQualityCurrentConditions","Source":"Plume Labs","SourceId":63,"PartnerSourceUrl":"https://air.plumelabs.com/air-quality-in-tel-aviv-1ekd"},{"DataType":"AirQualityForecasts","Source":"Plume Labs","SourceId":63,"PartnerSourceUrl":"https://air.plumelabs.com/air-quality-in-tel-aviv-1ekd"},{"DataType":"Alerts","Source":"Israel Meteorological Service","SourceId":53},{"DataType":"CurrentConditions","Source":"AccuWeather","SourceId":1},{"DataType":"DailyForecast","Source":"AccuWeather","SourceId":1},{"DataType":"ForecastConfidence","Source":"AccuWeather","SourceId":1},{"DataType":"HourlyForecast","Source":"AccuWeather","SourceId":1}],"CanonicalPostalCode":"","CanonicalLocationKey":"215854"}}]';
//    var decodeData = jsonDecode(body);
//    Data data = Data();
//    data.key = decodeData[0]['Key'];
//    data.city = decodeData[0]['EnglishName'];
//    return data;
//  }

  Future getTemperature(String newCity, String key) async {
    Data returnedData = await getData(newCity);
    if (returnedData.errorData != null) {
      return returnedData;
    } else {
      Data data = Data();
      http.Response response = await http.get('$website/currentconditions/v1/$key?apikey=$apiKey&language=en-us');
      try {
        if (response.statusCode == 200) {
          String body = response.body;
          var decodeData = jsonDecode(body);
          data.temperature = decodeData[0]['Temperature']['Metric']['Value'].toString();
          data.description = decodeData[0]['WeatherText'];
          data.city = returnedData.city;
          data.key = returnedData.key;
        } else {
          returnedData.errorData = ErrorData(response.statusCode, Constants.ERROR);
        }
        return data;
      } catch (e) {
        ErrorData error = ErrorData(response.statusCode, e.toString());
        data.errorData = error;
        return data;
      }
    }
  }

//  Future getTemperatureList(String newCity, String key, List list) async {
//    if (list.isNotEmpty) {
//      for (item in list) {
//        getTemperature(newCity, key);
//      }
//    }
//  }

//  Future getTemperature(String newCity, String key) async {
//    Data returnedData = await getData(newCity);
//    String body =
//        '[{"LocalObservationDateTime":"2021-02-05T21:26:00+02:00","EpochTime":1612553160,"WeatherText":"Some clouds","WeatherIcon":36,"HasPrecipitation":false,"PrecipitationType":null,"IsDayTime":false,"Temperature":{"Metric":{"Value":18.2,"Unit":"C","UnitType":17},"Imperial":{"Value":65.0,"Unit":"F","UnitType":18}},"MobileLink":"http://m.accuweather.com/en/il/tel-aviv/215854/current-weather/215854?lang=en-us","Link":"http://www.accuweather.com/en/il/tel-aviv/215854/current-weather/215854?lang=en-us"}]';
//    var decodeData = jsonDecode(body);
//    Data data = Data();
//    data.temperature = decodeData[0]['Temperature']['Metric']['Value'].toString();
//    data.description = decodeData[0]['WeatherText'];
//    data.city = returnedData.city;
//    data.key = returnedData.key;
//    return data;
//  }

  Future getFiveDaysForecast(String fiveDaysCity) async {
    Data returnedKey = await getData(fiveDaysCity);
    if (returnedKey.errorData != null) {
      return returnedKey;
    } else {
      Data data = Data();
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
            d.firstDay = newDateFormat + (i - 1);
            fiveDaysData.add(d);
          }
          return fiveDaysData;
        } else {
          data.errorData = ErrorData(response.statusCode, Constants.ERROR);
          return data;
        }
      } catch (e) {
        ErrorData error = ErrorData(response.statusCode, e.toString());
        data.errorData = error;
        return data;
      }
    }
  }

//  Future getFiveDaysForecast(String fiveDaysCity) async {
//    Data returnedKey = await getData(fiveDaysCity);
//
//    DateTime date = DateTime.now();
//    int newDateFormat = date.weekday;
//    String body =
//        '{"Headline":{"EffectiveDate":"2021-02-08T07:00:00+02:00","EffectiveEpochDate":1612760400,"Severity":7,"Text":"Warm Monday","Category":"heat","EndDate":"2021-02-08T19:00:00+02:00","EndEpochDate":1612803600,"MobileLink":"http://m.accuweather.com/en/il/tel-aviv/215854/extended-weather-forecast/215854?unit=c&lang=en-us","Link":"http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?unit=c&lang=en-us"},"DailyForecasts":[{"Date":"2021-02-05T07:00:00+02:00","EpochDate":1612501200,"Sun":{"Rise":"2021-02-05T06:32:00+02:00","EpochRise":1612499520,"Set":"2021-02-05T17:18:00+02:00","EpochSet":1612538280},"Moon":{"Rise":"2021-02-05T00:28:00+02:00","EpochRise":1612477680,"Set":"2021-02-05T11:27:00+02:00","EpochSet":1612517220,"Phase":"WaningCrescent","Age":23},"Temperature":{"Minimum":{"Value":11.9,"Unit":"C","UnitType":17},"Maximum":{"Value":20.1,"Unit":"C","UnitType":17}},"RealFeelTemperature":{"Minimum":{"Value":14.0,"Unit":"C","UnitType":17},"Maximum":{"Value":21.7,"Unit":"C","UnitType":17}},"RealFeelTemperatureShade":{"Minimum":{"Value":14.0,"Unit":"C","UnitType":17},"Maximum":{"Value":18.4,"Unit":"C","UnitType":17}},"HoursOfSun":7.0,"DegreeDaySummary":{"Heating":{"Value":2.0,"Unit":"C","UnitType":17},"Cooling":{"Value":0.0,"Unit":"C","UnitType":17}},"AirAndPollen":[{"Name":"AirQuality","Value":38,"Category":"Good","CategoryValue":1,"Type":"Particle Pollution"},{"Name":"Grass","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Mold","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Ragweed","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Tree","Value":0,"Category":"Low","CategoryValue":1},{"Name":"UVIndex","Value":4,"Category":"Moderate","CategoryValue":2}],"Day":{"Icon":3,"IconPhrase":"Partly sunny","HasPrecipitation":false,"ShortPhrase":"Some clouds, then sunshine","LongPhrase":"Some clouds, then sunshine","PrecipitationProbability":25,"ThunderstormProbability":0,"RainProbability":25,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":11.1,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":355,"Localized":"N","English":"N"}},"WindGust":{"Speed":{"Value":42.6,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":286,"Localized":"WNW","English":"WNW"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":31},"Night":{"Icon":35,"IconPhrase":"Partly cloudy","HasPrecipitation":false,"ShortPhrase":"Partly cloudy","LongPhrase":"Partly cloudy","PrecipitationProbability":5,"ThunderstormProbability":0,"RainProbability":5,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":5.6,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":10,"Localized":"N","English":"N"}},"WindGust":{"Speed":{"Value":16.7,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":168,"Localized":"SSE","English":"SSE"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":27},"Sources":["AccuWeather"],"MobileLink":"http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=1&unit=c&lang=en-us","Link":"http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=1&unit=c&lang=en-us"},{"Date":"2021-02-06T07:00:00+02:00","EpochDate":1612587600,"Sun":{"Rise":"2021-02-06T06:32:00+02:00","EpochRise":1612585920,"Set":"2021-02-06T17:19:00+02:00","EpochSet":1612624740},"Moon":{"Rise":"2021-02-06T01:36:00+02:00","EpochRise":1612568160,"Set":"2021-02-06T12:10:00+02:00","EpochSet":1612606200,"Phase":"WaningCrescent","Age":24},"Temperature":{"Minimum":{"Value":10.6,"Unit":"C","UnitType":17},"Maximum":{"Value":20.0,"Unit":"C","UnitType":17}},"RealFeelTemperature":{"Minimum":{"Value":11.9,"Unit":"C","UnitType":17},"Maximum":{"Value":22.0,"Unit":"C","UnitType":17}},"RealFeelTemperatureShade":{"Minimum":{"Value":11.9,"Unit":"C","UnitType":17},"Maximum":{"Value":18.5,"Unit":"C","UnitType":17}},"HoursOfSun":9.7,"DegreeDaySummary":{"Heating":{"Value":3.0,"Unit":"C","UnitType":17},"Cooling":{"Value":0.0,"Unit":"C","UnitType":17}},"AirAndPollen":[{"Name":"AirQuality","Value":42,"Category":"Good","CategoryValue":1,"Type":"Ozone"},{"Name":"Grass","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Mold","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Ragweed","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Tree","Value":0,"Category":"Low","CategoryValue":1},{"Name":"UVIndex","Value":4,"Category":"Moderate","CategoryValue":2}],"Day":{"Icon":1,"IconPhrase":"Sunny","HasPrecipitation":false,"ShortPhrase":"Sunshine","LongPhrase":"Sunshine","PrecipitationProbability":2,"ThunderstormProbability":0,"RainProbability":2,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":9.3,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":255,"Localized":"WSW","English":"WSW"}},"WindGust":{"Speed":{"Value":16.7,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":295,"Localized":"WNW","English":"WNW"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":10},"Night":{"Icon":34,"IconPhrase":"Mostly clear","HasPrecipitation":false,"ShortPhrase":"Mainly clear","LongPhrase":"Mainly clear","PrecipitationProbability":1,"ThunderstormProbability":0,"RainProbability":1,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":5.6,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":198,"Localized":"SSW","English":"SSW"}},"WindGust":{"Speed":{"Value":9.3,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":269,"Localized":"W","English":"W"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":16},"Sources":["AccuWeather"],"MobileLink":"http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=2&unit=c&lang=en-us","Link":"http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=2&unit=c&lang=en-us"},{"Date":"2021-02-07T07:00:00+02:00","EpochDate":1612674000,"Sun":{"Rise":"2021-02-07T06:31:00+02:00","EpochRise":1612672260,"Set":"2021-02-07T17:20:00+02:00","EpochSet":1612711200},"Moon":{"Rise":"2021-02-07T02:42:00+02:00","EpochRise":1612658520,"Set":"2021-02-07T13:00:00+02:00","EpochSet":1612695600,"Phase":"WaningCrescent","Age":25},"Temperature":{"Minimum":{"Value":12.3,"Unit":"C","UnitType":17},"Maximum":{"Value":20.0,"Unit":"C","UnitType":17}},"RealFeelTemperature":{"Minimum":{"Value":12.7,"Unit":"C","UnitType":17},"Maximum":{"Value":21.8,"Unit":"C","UnitType":17}},"RealFeelTemperatureShade":{"Minimum":{"Value":12.7,"Unit":"C","UnitType":17},"Maximum":{"Value":18.6,"Unit":"C","UnitType":17}},"HoursOfSun":8.0,"DegreeDaySummary":{"Heating":{"Value":2.0,"Unit":"C","UnitType":17},"Cooling":{"Value":0.0,"Unit":"C","UnitType":17}},"AirAndPollen":[{"Name":"AirQuality","Value":38,"Category":"Good","CategoryValue":1,"Type":"Ozone"},{"Name":"Grass","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Mold","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Ragweed","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Tree","Value":0,"Category":"Low","CategoryValue":1},{"Name":"UVIndex","Value":4,"Category":"Moderate","CategoryValue":2}],"Day":{"Icon":2,"IconPhrase":"Mostly sunny","HasPrecipitation":false,"ShortPhrase":"Partly to mostly sunny","LongPhrase":"Partly to mostly sunny","PrecipitationProbability":0,"ThunderstormProbability":0,"RainProbability":0,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":7.4,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":256,"Localized":"WSW","English":"WSW"}},"WindGust":{"Speed":{"Value":13.0,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":288,"Localized":"WNW","English":"WNW"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":24},"Night":{"Icon":33,"IconPhrase":"Clear","HasPrecipitation":false,"ShortPhrase":"Clear","LongPhrase":"Clear","PrecipitationProbability":0,"ThunderstormProbability":0,"RainProbability":0,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":5.6,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":43,"Localized":"NE","English":"NE"}},"WindGust":{"Speed":{"Value":9.3,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":57,"Localized":"ENE","English":"ENE"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":3},"Sources":["AccuWeather"],"MobileLink":"http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=3&unit=c&lang=en-us","Link":"http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=3&unit=c&lang=en-us"},{"Date":"2021-02-08T07:00:00+02:00","EpochDate":1612760400,"Sun":{"Rise":"2021-02-08T06:30:00+02:00","EpochRise":1612758600,"Set":"2021-02-08T17:21:00+02:00","EpochSet":1612797660},"Moon":{"Rise":"2021-02-08T03:47:00+02:00","EpochRise":1612748820,"Set":"2021-02-08T13:55:00+02:00","EpochSet":1612785300,"Phase":"WaningCrescent","Age":26},"Temperature":{"Minimum":{"Value":14.5,"Unit":"C","UnitType":17},"Maximum":{"Value":23.9,"Unit":"C","UnitType":17}},"RealFeelTemperature":{"Minimum":{"Value":14.6,"Unit":"C","UnitType":17},"Maximum":{"Value":25.9,"Unit":"C","UnitType":17}},"RealFeelTemperatureShade":{"Minimum":{"Value":14.6,"Unit":"C","UnitType":17},"Maximum":{"Value":22.8,"Unit":"C","UnitType":17}},"HoursOfSun":5.8,"DegreeDaySummary":{"Heating":{"Value":0.0,"Unit":"C","UnitType":17},"Cooling":{"Value":1.0,"Unit":"C","UnitType":17}},"AirAndPollen":[{"Name":"AirQuality","Value":37,"Category":"Good","CategoryValue":1,"Type":"Ozone"},{"Name":"Grass","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Mold","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Ragweed","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Tree","Value":0,"Category":"Low","CategoryValue":1},{"Name":"UVIndex","Value":4,"Category":"Moderate","CategoryValue":2}],"Day":{"Icon":6,"IconPhrase":"Mostly cloudy","HasPrecipitation":false,"ShortPhrase":"Mostly cloudy and warm","LongPhrase":"Mostly cloudy and warm","PrecipitationProbability":0,"ThunderstormProbability":0,"RainProbability":0,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":5.6,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":287,"Localized":"WNW","English":"WNW"}},"WindGust":{"Speed":{"Value":11.1,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":322,"Localized":"NW","English":"NW"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":58},"Night":{"Icon":35,"IconPhrase":"Partly cloudy","HasPrecipitation":false,"ShortPhrase":"Partly cloudy and mild","LongPhrase":"Partly cloudy and mild","PrecipitationProbability":0,"ThunderstormProbability":0,"RainProbability":0,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":5.6,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":132,"Localized":"SE","English":"SE"}},"WindGust":{"Speed":{"Value":9.3,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":94,"Localized":"E","English":"E"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":90},"Sources":["AccuWeather"],"MobileLink":"http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=4&unit=c&lang=en-us","Link":"http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=4&unit=c&lang=en-us"},{"Date":"2021-02-09T07:00:00+02:00","EpochDate":1612846800,"Sun":{"Rise":"2021-02-09T06:29:00+02:00","EpochRise":1612844940,"Set":"2021-02-09T17:22:00+02:00","EpochSet":1612884120},"Moon":{"Rise":"2021-02-09T04:47:00+02:00","EpochRise":1612838820,"Set":"2021-02-09T14:56:00+02:00","EpochSet":1612875360,"Phase":"WaningCrescent","Age":27},"Temperature":{"Minimum":{"Value":13.4,"Unit":"C","UnitType":17},"Maximum":{"Value":24.5,"Unit":"C","UnitType":17}},"RealFeelTemperature":{"Minimum":{"Value":13.7,"Unit":"C","UnitType":17},"Maximum":{"Value":26.6,"Unit":"C","UnitType":17}},"RealFeelTemperatureShade":{"Minimum":{"Value":13.7,"Unit":"C","UnitType":17},"Maximum":{"Value":23.2,"Unit":"C","UnitType":17}},"HoursOfSun":10.6,"DegreeDaySummary":{"Heating":{"Value":0.0,"Unit":"C","UnitType":17},"Cooling":{"Value":1.0,"Unit":"C","UnitType":17}},"AirAndPollen":[{"Name":"AirQuality","Value":42,"Category":"Good","CategoryValue":1,"Type":"Ozone"},{"Name":"Grass","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Mold","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Ragweed","Value":0,"Category":"Low","CategoryValue":1},{"Name":"Tree","Value":0,"Category":"Low","CategoryValue":1},{"Name":"UVIndex","Value":4,"Category":"Moderate","CategoryValue":2}],"Day":{"Icon":1,"IconPhrase":"Sunny","HasPrecipitation":false,"ShortPhrase":"Sunny and pleasantly warm","LongPhrase":"Sunny and pleasantly warm","PrecipitationProbability":0,"ThunderstormProbability":0,"RainProbability":0,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":7.4,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":257,"Localized":"WSW","English":"WSW"}},"WindGust":{"Speed":{"Value":13.0,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":292,"Localized":"WNW","English":"WNW"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":4},"Night":{"Icon":35,"IconPhrase":"Partly cloudy","HasPrecipitation":false,"ShortPhrase":"Patchy clouds and mild","LongPhrase":"Patchy clouds and mild","PrecipitationProbability":0,"ThunderstormProbability":0,"RainProbability":0,"SnowProbability":0,"IceProbability":0,"Wind":{"Speed":{"Value":5.6,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":112,"Localized":"ESE","English":"ESE"}},"WindGust":{"Speed":{"Value":9.3,"Unit":"km/h","UnitType":7},"Direction":{"Degrees":112,"Localized":"ESE","English":"ESE"}},"TotalLiquid":{"Value":0.0,"Unit":"mm","UnitType":3},"Rain":{"Value":0.0,"Unit":"mm","UnitType":3},"Snow":{"Value":0.0,"Unit":"cm","UnitType":4},"Ice":{"Value":0.0,"Unit":"mm","UnitType":3},"HoursOfPrecipitation":0.0,"HoursOfRain":0.0,"HoursOfSnow":0.0,"HoursOfIce":0.0,"CloudCover":33},"Sources":["AccuWeather"],"MobileLink":"http://m.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=5&unit=c&lang=en-us","Link":"http://www.accuweather.com/en/il/tel-aviv/215854/daily-weather-forecast/215854?day=5&unit=c&lang=en-us"}]}';
//    var decodeData = jsonDecode(body);
//    List<Data> fiveDaysData = List();
//    for (int i = 0; i < 5; i++) {
//      Data d = Data();
//      d.minTemp = decodeData['DailyForecasts'][i]['Temperature']['Minimum']['Value'].toString();
//      d.maxTemp = decodeData['DailyForecasts'][i]['Temperature']['Maximum']['Value'].toString();
//      d.firstDay = newDateFormat + (i - 1);
//      fiveDaysData.add(d);
//    }
//    return fiveDaysData;
//  }

  Future searchCity(String search) async {
    http.Response response =
        await http.get('$website/locations/v1/cities/autocomplete?apikey=$apiKey&q=$search&language=en-us');
    Data d = Data();
    try {
      if (response.statusCode == 200) {
        String body = response.body;
        var decodeData = jsonDecode(body);
        List<Data> searchCity = List();
        for (int i = 0; i < decodeData.length; i++) {
          d.key = decodeData[i]['Key'];
          d.city = decodeData[i]['LocalizedName'];
          searchCity.add(d);
          print(searchCity[i].city);
          print(searchCity[i].key);
        }
        return searchCity;
      } else {
        d.errorData = ErrorData(response.statusCode, Constants.ERROR);
        return d;
      }
    } catch (e) {
      ErrorData error = ErrorData(response.statusCode, e.toString());
      d.errorData = error;
      return;
    }
  }
}
