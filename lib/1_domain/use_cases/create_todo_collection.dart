import 'package:either_dart/either.dart';
import 'package:todo_cleanarch/1_domain/failure/failure.dart';
import 'package:todo_cleanarch/1_domain/repositiries/todo_repository.dart';
import 'package:todo_cleanarch/core/use_case.dart';

class CreateToDoCollection implements UseCase<bool, ToDoCollectionParams> {
  CreateToDoCollection({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, bool>> call(params) async {
    try {
      final result = toDoRepository.createToDoCollection(params.collection);

      return result.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
