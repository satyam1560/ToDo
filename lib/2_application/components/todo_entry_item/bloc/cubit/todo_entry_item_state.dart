// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_entry_item_cubit.dart';

class TodoEntryItemState extends Equatable {
  const TodoEntryItemState();

  @override
  List<Object> get props => [];
}

class TodoEntryItemLoadingState extends TodoEntryItemState {}

class TodoEntryItemErrorState extends TodoEntryItemState {}

class TodoEntryItemLoadedState extends TodoEntryItemState {
  const TodoEntryItemLoadedState({
    required this.toDoEntry,
  });
  final ToDoEntry toDoEntry;

  @override
  List<Object> get props => [toDoEntry];
}
