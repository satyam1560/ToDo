// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/src/either.dart';
import 'package:todo_cleanarch/1_domain/entities/todo_entry.dart';
import 'package:todo_cleanarch/1_domain/failure/failure.dart';
import 'package:todo_cleanarch/1_domain/repositiries/todo_repository.dart';
import 'package:todo_cleanarch/core/use_case.dart';

class UpdateToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParam> {
  final ToDoRepository toDoRepository;
  UpdateToDoEntry({
    required this.toDoRepository,
  });
  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadedEntry = await toDoRepository.updateToDoEntry(
          collectionId: params.collectionId, entryId: params.entryId);
      return loadedEntry.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
