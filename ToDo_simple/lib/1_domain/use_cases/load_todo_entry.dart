import 'package:either_dart/either.dart';

import '../../core/use_case.dart';
import '../entities/todo_entry.dart';
import '../failures/failures.dart';
import '../repositories/todo_repository.dart';

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
