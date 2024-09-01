import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../datasources/todo_data_source.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repo.dart';

@LazySingleton(as: TodoRepo)
class TodoRepoImpl implements TodoRepo {
  final TodoDataSource _todoDataSource;

  TodoRepoImpl({required TodoDataSource todoDataSource})
      : _todoDataSource = todoDataSource;

  @override
  Future<Either<String, Todo>> getTodoById(int id) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> addTodo(Todo todo) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> deleteTodoById(int id) {
    // TODO: implement deleteTodoById
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Todo>>> getTodos() async {
    try {
      final todos = await _todoDataSource.getToDos();
      return Right(todos);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Todo>> updateTodo({
    required int id,
    required Todo todo,
  }) async {
    try {
      final updatedTodo = await _todoDataSource.updateToDo(
        id: id,
        todo: todo,
      );
      return Right(updatedTodo);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
