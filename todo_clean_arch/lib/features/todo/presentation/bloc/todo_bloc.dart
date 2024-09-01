import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

@lazySingleton
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUsecase _todoUsecase;
  TodoBloc({
    required TodoUsecase todoUsecase,
  })  : _todoUsecase = todoUsecase,
        super(TodoState.initial()) {
    on<TodoFetched>(_getToDo);
    on<TodoUpdated>(_updateTodo);
  }

  FutureOr<void> _updateTodo(
    TodoUpdated event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: ToDoStatus.loading));

    final todoId = event.todo.id;
    if (todoId == null) {
      return;
    }

    final result = await _todoUsecase.updateTodo(
      id: event.todo.id!,
      todo: event.todo,
    );
    result.fold(
      (error) => emit(
        state.copyWith(
          status: ToDoStatus.failed,
          message: error,
        ),
      ),
      (todos) => emit(
        state.copyWith(),
      ),
    );

    add(TodoFetched());
  }

  FutureOr<void> _getToDo(
    TodoFetched event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: ToDoStatus.loading));
    final result = await _todoUsecase.getTodos();

    result.fold(
      (error) => emit(
        state.copyWith(
          status: ToDoStatus.failed,
          message: error,
        ),
      ),
      (todos) => emit(
        state.copyWith(
          status: ToDoStatus.success,
          todoList: todos,
        ),
      ),
    );
  }
}
