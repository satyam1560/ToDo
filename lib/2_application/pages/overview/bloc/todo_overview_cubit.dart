import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../1_domain/entities/todo_collection.dart';
import '../../../../1_domain/use_cases/load_todo_collections.dart';
import '../../../../core/use_case.dart';

part 'todo_overview_cubit_state.dart';

class ToDoOverviewCubit extends Cubit<ToDoOverviewCubitState> {
  ToDoOverviewCubit({
    required this.loadToDoCollections,
    ToDoOverviewCubitState? initialState,
  }) : super(initialState ?? const ToDoOverviewCubitLoadingState());

  final LoadToDoCollections loadToDoCollections;

  Future<void> readToDoCollections() async {
    emit(const ToDoOverviewCubitLoadingState());
    try {
      final collectionsFuture = loadToDoCollections.call(NoParams());
      final collections = await collectionsFuture;

      if (collections.isLeft) {
        emit(const ToDoOverviewCubitErrorState());
      } else {
        emit(ToDoOverviewCubitLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(const ToDoOverviewCubitErrorState());
    }
  }
}
