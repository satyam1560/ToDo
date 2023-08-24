part of 'todo_overview_cubit.dart';

abstract class ToDoOverviewCubitState extends Equatable {
  const ToDoOverviewCubitState();

  @override
  List<Object> get props => [];
}

class ToDoOverviewCubitLoadingState extends ToDoOverviewCubitState {}

class ToDoOverviewCubitErroState extends ToDoOverviewCubitState {}

class ToDoOverviewCubitLoadedState extends ToDoOverviewCubitState {
  const ToDoOverviewCubitLoadedState({required this.collection});
  final List<ToDoCollection> collection;

  @override
  List<Object> get props => [collection];
}
