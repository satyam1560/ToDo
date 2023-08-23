import 'package:either_dart/either.dart';
import 'package:todo_cleanarch/1_domain/entities/todo_collection.dart';
import 'package:todo_cleanarch/1_domain/failure/failure.dart';

import '../../core/use_case.dart';
import '../repositiries/todo_repository.dart';

class LoadToDoCollection implements UseCase<List<ToDoCollection>, NoParams> {
  LoadToDoCollection({required this.toDoRepository});
  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<ToDoCollection>>> call(params) async {
    try {
      final loadedCollections = toDoRepository.readToDoCollections();
      return loadedCollections.fold(
          (left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
