import 'dart:math';

import 'package:http_error_handling/api_helper.dart';
import 'package:http_error_handling/models/photo.dart';
import 'package:http_error_handling/repository/repository.dart';

class PhotoRepository implements Repository<Photo> {
  final ApiHelper _apiHelper = ApiHelper();
  final String url = 'photos';

  @override
  Future<Photo> create(model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Photo> get() async {
    final id = Random().nextInt(200) + 1;

    final response = await _apiHelper.get('$url/$id');

    return Photo.fromJson(response);
  }

  @override
  Future<List<Photo>> search() async {
    final albumId = Random().nextInt(200) + 1;
    final response = await _apiHelper.get('$url?albumId=$albumId');

    return PhotoSearch.fromJson(response).data;
  }

  @override
  Future<Photo> update(model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
