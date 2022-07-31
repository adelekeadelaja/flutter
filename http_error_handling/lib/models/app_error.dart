class AppError {
  late String code;
  late String reason;

  AppError.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    reason = json['reason'];
  }
}
