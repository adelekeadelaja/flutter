import 'package:flutter/material.dart';
import 'package:http_error_handling/models/api_response.dart';
import 'package:http_error_handling/models/photo.dart';
import 'package:http_error_handling/models/todo.dart';
import 'package:http_error_handling/providers/repository_provider.dart';
import 'package:http_error_handling/repository/photo_repository.dart';
import 'package:http_error_handling/repository/todo_repository.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final providerTodo = Provider.of<RepositoryProvider<Photo>>(context);
    final providerPhoto = Provider.of<RepositoryProvider<Todo>>(context);

    // initialize using the setter `repo`
    providerTodo.repo = TodoRepository();
    providerPhoto.repo = PhotoRepository();

    // use the response from the provider
    final responseTodo = providerTodo.response;
    final responsePhoto = providerPhoto.response;

    // show error in a snackbar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (responseTodo.status == Status.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: context.size!.width * 0.4,
            content: Text(
              responseTodo.message ?? 'Error happened here.',
              style: const TextStyle(color: Colors.white),
            ),
            action: SnackBarAction(
              label: 'Dismiss',
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          if (responseTodo.status == Status.completed)
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Text(responseTodo.status.toString()),
            ),

          // list of data
          if (responseTodo.data != null) todoListView(responseTodo.data)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerTodo.searchData();
          providerPhoto.getData();
        },
        tooltip: 'http get data',
        child: const Icon(Icons.download),
      ),
    );
  }

  Widget todoListView(List<Todo> todos) {
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];

          return Container(
            margin: EdgeInsets.zero,
            child: ListTile(
              autofocus: true,
              leading: Text(todo.id.toString()),
              title: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: '${todo.userId} >> ',
                      style: const TextStyle(color: Colors.orange),
                    ),
                    TextSpan(text: todo.title),
                    TextSpan(
                      text: ' >> ${todo.completed}',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
