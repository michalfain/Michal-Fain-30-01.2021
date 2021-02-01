class FiveDaysData {
  String _day;
  String _minTemp;
  String _maxTemp;

  String get day => _day;

  set day(String value) {
    _day = value;
  }

  String get minTemp => _minTemp;

  String get maxTemp => _maxTemp;

  set maxTemp(String value) {
    _maxTemp = value;
  }

  set minTemp(String value) {
    _minTemp = value;
  }
}
