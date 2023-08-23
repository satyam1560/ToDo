import 'package:either_dart/either.dart';
import 'package:todo_cleanarch/1_domain/entities/todo_collection.dart';

import '../failure/failure.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections();
}
