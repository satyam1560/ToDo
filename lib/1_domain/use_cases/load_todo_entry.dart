import 'package:either_dart/either.dart';
import 'package:todo_cleanarch/1_domain/entities/todo_entry.dart';
import 'package:todo_cleanarch/1_domain/failure/failure.dart';
import 'package:todo_cleanarch/core/use_case.dart';

import '../repositiries/todo_repository.dart';

class LoadToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParam> {
  const LoadToDoEntry({
    required this.toDoRepository,
  });
  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadedEntry = toDoRepository.readToDoEntry(
        params.collectionId,
        params.entryId,
      );

      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
