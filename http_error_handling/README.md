# http_error_handling

In this project, I cover how to handle http request errors like a pro. In addition, you would learn some coding best practices in dart such as use of abstract classes and interfaces and how to maintain SOLID principles in general. 

## Getting Started

This project is a basic Flutter project broken down into the following folders.

- main.dart

    this is the main entry of the application and contains a simple `main()` method.

- lib/exception

    contains the custom exception classes used in the app.

- lib/models

    contains data models and an API Response helper which holds a specific type of data based on the outcome of API requests.

- lib/providers

    State management is handled by the repository provider. In this example, I used a provider that extends the `ChangeNotifier`, however you could achieve the same result using a `ValueNotifier` approach by registering a `ListenableNotifier` in _`main.dart`_, introducing `ValueListenableBuilder` in _`main_screen.dart`_, and refactor the _`lib/providers/repository_provider.dart`_ to expose a `ValueNotifier` on _ApiResponse_ object. You may read more on the difference between _ChangeNotifier_ and _ValueNotifier_.

- lib/repository

    Contains an abstract class or interface (`repository.dart`)) which defines the methods that derived classes (`todo_repository.dart`) must define concrete implementations for.

- lib/screens

    This contains the default screen of the app and shows how the provider is consumed to demonstrate how to handle errors in the app.
