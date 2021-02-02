import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(Constants.TEL_AVIV_CITY_KEY, Constants.TEL_AVIV),
    );
  }
}
