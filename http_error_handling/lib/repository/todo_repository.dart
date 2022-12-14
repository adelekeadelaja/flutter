import 'dart:math';

import 'package:http_error_handling/api_helper.dart';
import 'package:http_error_handling/models/todo.dart';
import 'package:http_error_handling/repository/repository.dart';

class TodoRepository implements Repository<Todo> {
  final ApiHelper _apiHelper = ApiHelper();
  final String url = 'todos';

  @override
  Future<Todo> create(model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Todo> get() async {
    final id = Random().nextInt(300) + 1;

    final response = await _apiHelper.get('$url/$id');

    return Todo.fromJson(response);
  }

  @override
  Future<List<Todo>> search() async {
    final userId = Random().nextInt(20) + 1;
    final response = await _apiHelper.get('$url?userId=$userId');

    return TodoSearch.fromJson(response).data;
  }

  @override
  Future<Todo> update(model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
