import 'package:flutter/material.dart';
import 'package:http_error_handling/models/api_response.dart';
import 'package:http_error_handling/models/todo.dart';
import 'package:http_error_handling/providers/repository_provider.dart';
import 'package:http_error_handling/repository/todo_repository.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RepositoryProvider>(context);

    // initialize the repo
    provider.repo = TodoRepository();

    // use the response from the provider
    final response = provider.response;

    // show error in a snackbar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (response.status == Status.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: context.size!.width * 0.4,
            content: Text(
              response.message ?? 'Error happened here.',
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
          if (response.status == Status.completed)
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Text(response.status.toString()),
            ),

          // list of data
          if (response.data != null) todoListView(response.data)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.fetchData,
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
