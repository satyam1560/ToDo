import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/todo/domain/entities/todo.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/todos')
  Future<List<Todo>> getTodos();

  @PUT('/todos/{id}')
  Future<Todo> updateTodo(
    @Path('id') int id,
    @Body() Todo todo,
  );
}
