class AppException implements Exception {
  AppException([this.message, this.prefix]);

  final String? message;
  final String? prefix;

  @override
  String toString() {
    return '$prefix: $message';
  }
}

class AccessDeniedException extends AppException {
  AccessDeniedException([message]) : super(message, 'Forbiden');
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
