import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../entities/todo.dart';
import '../repositories/todo_repo.dart';

@LazySingleton()
class TodoUsecase implements TodoRepo {
  TodoUsecase({required TodoRepo todoRepo}) : _todoUsecase = todoRepo;
  final TodoRepo _todoUsecase;

  @override
  Future<Either<String, void>> addTodo(Todo todo) async {
    return await _todoUsecase.addTodo(todo);
  }

  @override
  Future<Either<String, void>> deleteTodoById(int id) async {
    return await _todoUsecase.deleteTodoById(id);
  }

  @override
  Future<Either<String, Todo>> getTodoById(int id) async {
    return await _todoUsecase.getTodoById(id);
  }

  @override
  Future<Either<String, List<Todo>>> getTodos() async {
    return await _todoUsecase.getTodos();
  }

  @override
  Future<Either<String, Todo>> updateTodo({
    required int id,
    required Todo todo,
  }) async {
    return await _todoUsecase.updateTodo(
      id: id,
      todo: todo,
    );
  }
}
