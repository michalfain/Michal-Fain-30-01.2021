class ErrorData {
  String _message;
  String _statusCode;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get statusCode => _statusCode;

  set statusCode(String value) {
    _statusCode = value;
  }
}
