import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_error_handling/models/api_response.dart';
import 'package:http_error_handling/models/app_error.dart';
import 'package:http_error_handling/repository/repository.dart';

class RepositoryProvider<T> extends ChangeNotifier {
  RepositoryProvider() {
    response = ApiResponse();
  }

  Repository? _repository;
  late ApiResponse response;

  // setter
  set repo(Repository repository) => _repository = repository;

  void _handleError(Object e) {
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

  void getData() async {
    _futureCall(_repository?.get());
    // if (_repository != null) {
    //   response = ApiResponse.started('Fetching data...');
    //   notifyListeners();

    //   try {
    //     final data = await _repository?.get();
    //     response = ApiResponse.completed(data);
    //   } catch (e) {
    //     _handleError(e);
    //   }
    // } else {
    //   _setApiResponseError('no repository defined.');
    // }

    // notifyListeners();
  }

  void searchData() async {
    _futureCall(_repository?.search());
    // if (_repository != null) {
    //   response = ApiResponse.started('Fetching data...');
    //   notifyListeners();

    //   try {
    //     final data = await _repository?.search();
    //     response = ApiResponse.completed(data);
    //   } catch (e) {
    //     _handleError(e);
    //   }
    // } else {
    //   _setApiResponseError('no repository defined.');
    // }

    // notifyListeners();
  }

  void _futureCall(Future? f) async {
    if (_repository != null) {
      response = ApiResponse.started('Fetching data...');
      notifyListeners();

      try {
        final data = await f;
        response = ApiResponse.completed(data);
      } catch (e) {
        _handleError(e);
      }
    } else {
      _setApiResponseError('no repository defined.');
    }

    notifyListeners();
  }

  void _setApiResponseError(String? reason, [Object? e]) {
    response = ApiResponse.error(reason ?? e.toString());
  }
}
