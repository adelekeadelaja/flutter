import 'package:flutter/material.dart';
import 'package:http_error_handling/models/photo.dart';
import 'package:http_error_handling/models/todo.dart';
import 'package:http_error_handling/providers/repository_provider.dart';
import 'package:http_error_handling/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => RepositoryProvider<Photo>()),
        ChangeNotifierProvider(create: (context) => RepositoryProvider<Todo>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HTTP Error Handling Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(title: 'HTTP Error Home'),
    );
  }
}
