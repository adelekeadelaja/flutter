import 'dart:math';

import 'package:http_error_handling/api_helper.dart';
import 'package:http_error_handling/models/todo.dart';
import 'package:http_error_handling/repository/repository.dart';

class TodoRepository implements Repository {
  final ApiHelper _apiHelper = ApiHelper();

  @override
  Future<List<Todo>> search() async {
    final changeUrl = Random().nextBool();
    String url = 'todos';

    if (changeUrl) url = 'todoss?page=1';
    final response = await _apiHelper.get(url);

    return TodoSearch.fromJson(response).data;
  }
}
