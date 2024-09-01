import 'package:dartz/dartz.dart';
import '../entities/todo.dart';

abstract class TodoRepo {
  Future<Either<String, List<Todo>>> getTodos();

  Future<Either<String, Todo>> getTodoById(int id);

  Future<Either<String, void>> addTodo(Todo todo);

  Future<Either<String, Todo>> updateTodo({
    required int id,
    required Todo todo,
  });

  Future<Either<String, void>> deleteTodoById(int id);
}
//signature povide