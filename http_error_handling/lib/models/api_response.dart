class ApiResponse<T> {
  Status? status;
  String? message;
  T? data;

  /// Default constructor
  ApiResponse();

  /// [ApiResponse.started] named constructor.
  ApiResponse.started(this.message) : status = Status.started;

  /// [ApiResponse.completed] named constructor.
  ApiResponse.completed(this.data) : status = Status.completed;

  /// [ApiResponse.error] named constructor.
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return 'Status: $status \r\n Message: $message \r\n Data: $data';
  }
}

enum Status {
  started,
  completed,
  error,
}
