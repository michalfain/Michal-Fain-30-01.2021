class Data {
  String _key;
  String _city;
  String _temperature;
  String _description;

  String get key => _key;

  set key(String value) {
    _key = value;
  }

  String get city => _city;

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get temperature => _temperature;

  set temperature(String value) {
    _temperature = value;
  }

  set city(String value) {
    _city = value;
  }
}
