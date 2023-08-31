import 'package:either_dart/either.dart';

import '../../core/use_case.dart';
import '../failures/failures.dart';
import '../repositories/todo_repository.dart';

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
