class AppException implements Exception {
  AppException([this._message, this._prefix]);

  final String? _message;
  final String? _prefix;

  @override
  String toString() {
    return '$_prefix: $_message';
  }
}

class GetDataException extends AppException {
  GetDataException([message]) : super(message, 'Response Error');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([message]) : super(message, 'Unauthorized');
}
