class TodoSearch {
  late int id;
  late List<Todo> data;

  TodoSearch.fromJson(List<dynamic>? json) {
    data = [];

    if (json != null) {
      int counter = 0;

      for (var value in json) {
        id = counter++;
        data.add(Todo.fromJson(value));
      }
    }
  }
}

class Todo {
  late int id;
  late int userId;
  late String title;
  late bool completed;

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    completed = json['completed'];
  }
}
