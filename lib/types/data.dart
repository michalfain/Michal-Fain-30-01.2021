class Data {
  String _key = 'un';
  String _city = 'un';
  String _temperature = 'un';
  String _description = 'un';

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

//  Data(this.key, this.city);
//  Data(this.temperature, this.description);
//  Data(this.key, this.city, this.temperature, this.description);
}
