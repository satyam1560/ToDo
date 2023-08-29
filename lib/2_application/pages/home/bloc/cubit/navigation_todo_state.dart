// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'navigation_todo_cubit.dart';

class NavigationTodoCubitState extends Equatable {
  const NavigationTodoCubitState({
    this.selectedCollectionId,
    this.isSecondBodyIsDisplayed,
  });

  final CollectionId? selectedCollectionId;
  final bool? isSecondBodyIsDisplayed;

  @override
  List<Object?> get props => [selectedCollectionId, isSecondBodyIsDisplayed];
}

class NavigationTodoInitial extends NavigationTodoCubit {}
