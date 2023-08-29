import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cleanarch/1_domain/entities/unique_id.dart';

part 'navigation_todo_state.dart';

class NavigationTodoCubit extends Cubit<NavigationTodoCubitState> {
  NavigationTodoCubit() : super(const NavigationTodoCubitState());

  void selectedToDoCollectionChanged(CollectionId collectionId) {
    emit(NavigationTodoCubitState(selectedCollectionId: collectionId));
  }

  void secondBodyHasChanged({required isSecondBodyDisplayed}) {
    if (state.isSecondBodyIsDisplayed != isSecondBodyDisplayed) {
      emit(NavigationTodoCubitState(
          isSecondBodyIsDisplayed: isSecondBodyDisplayed,
          selectedCollectionId: state.selectedCollectionId));
    }
  }
}
