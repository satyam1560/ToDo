part of 'todo_bloc.dart';

enum ToDoStatus { initial, loading, success, failed }

class TodoState extends Equatable {
  const TodoState({
    required this.status,
    this.todoList = const [],
    this.message = '',
  });
  final ToDoStatus status;
  final List<Todo>? todoList;
  final String? message;

  @override
  List<Object?> get props => [status, todoList, message];
  factory TodoState.initial() => const TodoState(status: ToDoStatus.initial);

  TodoState copyWith({
    ToDoStatus? status,
    List<Todo>? todoList,
    String? message,
  }) {
    return TodoState(
      status: status ?? this.status,
      todoList: todoList ?? this.todoList,
      message: message ?? this.message,
    );
  }
}
