import 'package:injectable/injectable.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/todo.dart';

@singleton
class TodoDataSource {
  TodoDataSource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<Todo>> getToDos() async {
    return _apiClient.getTodos();
  }

  Future<Todo> updateToDo({
    required int id,
    required Todo todo,
  }) async {
    return await _apiClient.updateTodo(
      id,
      todo,
    );
  }
}
