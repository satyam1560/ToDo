import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '0_data/repositories/todo_repository_mock.dart';
import '1_domain/repositories/todo_repository.dart';
import '2_application/app/basic_app.dart';

void main() {
  runApp(
    RepositoryProvider<ToDoRepository>(
      create: (context) => ToDoRepositoryMock(),
      child: const BasicApp(),
    ),
  );
}
