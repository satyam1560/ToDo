part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoFetched extends TodoEvent {}

class TodoUpdated extends TodoEvent {
  final Todo todo;
  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];
}
