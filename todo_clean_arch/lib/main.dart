import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'core/constants/api_constant.dart';
import 'features/todo/presentation/pages/todo_home.dart';
import 'injectible.dart';

void main() {
  configureDependencies();
  getIt<Dio>().interceptors.addAll([]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoHome(),
    );
  }
}
