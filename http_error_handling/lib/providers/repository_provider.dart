import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_error_handling/models/api_response.dart';
import 'package:http_error_handling/models/app_error.dart';
import 'package:http_error_handling/repository/repository.dart';

class RepositoryProvider extends ChangeNotifier {
  RepositoryProvider() {
    response = ApiResponse();
  }

  Repository? _repository;
  late ApiResponse response;

  set repo(Repository repository) => _repository = repository;

  void fetchData() async {
    if (_repository != null) {
      response = ApiResponse.loading('Fetching data...');
      notifyListeners();

      try {
        final data = await _repository?.search();
        response = ApiResponse.completed(data);
      } catch (e) {
        AppError? appError;

        try {
          // try  jsonDecode to app error
          appError = AppError.fromJson(json.decode(e.toString()));
        } catch (e) {
          // not an application error model
        }

        _setApiResponseError(appError?.reason, e);
        debugPrint(e.toString());
      }
    } else {
      _setApiResponseError('no repository defined');
    }

    notifyListeners();
  }

  _setApiResponseError(String? reason, [Object? e]) {
    response = ApiResponse.error(reason ?? e.toString());
  }
}
