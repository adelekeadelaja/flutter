import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_error_handling/exception/app_exceptions.dart';

class ApiHelper {
  ApiHelper([this.baseUrl = 'https://jsonplaceholder.typicode.com/']);

  final String baseUrl;

  /// Handles POST http requests and returns a json decoded object
  Future<dynamic> post<T>(String url, T data) async {
    throw UnimplementedError();
  }

  /// Handles PUT http requests and returns a json decoded object
  Future<dynamic> put<T>(String url, T data) async {
    throw UnimplementedError();
  }

  /// Handles DELETE http requests and returns a json decoded object
  Future<dynamic> delete<T>(String url) async {
    throw UnimplementedError();
  }

  /// Handles GET http requests and returns a json decoded object
  /// or throws an error if the request failed.
  Future<dynamic> get(String url) async {
    dynamic responseJson;

    try {
      final uri = Uri.parse(baseUrl + url);
      final response = await http.get(uri);

      responseJson = _returnRespone(response);
    } on SocketException {
      throw GetDataException('No internet connection');
    }

    return responseJson;
  }

  _returnRespone(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body);
        debugPrint(responseJson.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
        throw UnauthorizedException(response.body);
      case 403:
        throw AccessDeniedException(response.body);
      case 500:
      default:
        throw GetDataException('Request failed on remote server.'
            '\r\nStatus code: ${response.statusCode}'
            '\r\nReason phrase: ${response.reasonPhrase}');
    }
  }
}
