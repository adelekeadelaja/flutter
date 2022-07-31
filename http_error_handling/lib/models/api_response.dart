class ApiResponse<T> {
  Status? status;
  String? message;
  T? data;

  /// Default constructor
  ApiResponse();

  /// [ApiResponse.loading] named constructor.
  ApiResponse.loading(this.message) : status = Status.loading;
  
  /// [ApiResponse.completed] named constructor.
  ApiResponse.completed(this.data) : status = Status.completed;
  
  /// [ApiResponse.error] named constructor.
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}

enum Status {
  loading,
  completed,
  error,
}
