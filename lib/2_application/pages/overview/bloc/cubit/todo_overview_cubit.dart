import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cleanarch/1_domain/entities/todo_collection.dart';
import 'package:todo_cleanarch/core/use_case.dart';

import '../../../../../1_domain/use_cases/load_overview_collection.dart';

part 'todo_overview_state.dart';

class ToDoOverviewCubit extends Cubit<ToDoOverviewCubitState> {
  ToDoOverviewCubit(
      {required this.loadToDoCollection, ToDoOverviewCubitState? initialState})
      : super(initialState ?? ToDoOverviewCubitLoadingState());

  final LoadToDoCollection loadToDoCollection;

  Future<void> readToDoCollection() async {
    emit(ToDoOverviewCubitLoadingState());
    try {
      final collectionsFuture = loadToDoCollection.call(NoParams());
      final collections = await collectionsFuture;
      if (collections.isLeft) {
        emit(ToDoOverviewCubitErroState());
      } else {
        emit(ToDoOverviewCubitLoadedState(collection: collections.right));
      }
    } on Exception {
      emit(ToDoOverviewCubitErroState());
    }
  }
}
