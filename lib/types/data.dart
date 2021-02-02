class Data {
  String _key;
  String _city;
  String _temperature;
  String _description;
  int _firstdDay;
  String _minTemp;
  String _maxTemp;

  String get key => _key;

  set key(String value) {
    _key = value;
  }

  String get city => _city;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  int get firstDay => _firstdDay;

  set firstDay(int value) {
    _firstdDay = value;
  }

  String get temperature => _temperature;

  set temperature(String value) {
    _temperature = value;
  }

  set city(String value) {
    _city = value;
  }

  String get maxTemp => _maxTemp;

  set maxTemp(String value) {
    _maxTemp = value;
  }

  String get minTemp => _minTemp;

  set minTemp(String value) {
    _minTemp = value;
  }
}
