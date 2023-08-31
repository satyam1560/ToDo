import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cleanarch/1_domain/entities/unique_id.dart';

import '../../../../../1_domain/use_cases/create_todo_entry.dart';
import '../../../../core/form_value.dart';

part 'create_todo_entry_page_state.dart';

class CreateToDoEntryPageCubit extends Cubit<CreateToDoEntryPageState> {
  CreateToDoEntryPageCubit({
    required this.collectionId,
    required this.addToDoEntry,
  }) : super(const CreateToDoEntryPageState());

  final CollectionId collectionId;
  final CreateToDoEntry addToDoEntry;

  void descriptionChanged({String? description}) {
    ValidationStatus currentStatus = ValidationStatus.pending;
    // could do more complex validation, like calling your backend and so on
    if (description == null || description.isEmpty || description.length < 2) {
      currentStatus = ValidationStatus.error;
    } else {
      currentStatus = ValidationStatus.success;
    }
    emit(
      state.copyWith(
        description: FormValue(
          value: description,
          validationStatus: currentStatus,
        ),
      ),
    );
  }

  void submit() {}
}
