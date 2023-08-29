import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cleanarch/1_domain/entities/unique_id.dart';
import 'package:todo_cleanarch/1_domain/repositiries/todo_repository.dart';
import 'package:todo_cleanarch/1_domain/use_cases/load_todo_entry.dart';

import '../../../1_domain/use_cases/update_todo_entry.dart';
import 'bloc/cubit/todo_entry_item_cubit.dart';
import 'view_states/todo_entry_item_error.dart';
import 'view_states/todo_entry_item_loaded.dart';
import 'view_states/todo_entry_item_loading.dart';

class ToDoEntryItemProvider extends StatelessWidget {
  const ToDoEntryItemProvider(
      {super.key, required this.collectionId, required this.entryId});

  final CollectionId collectionId;
  final EntryId entryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoEntryItemCubit(
        collectionId: collectionId,
        entryId: entryId,
        loadToDoEntry: LoadToDoEntry(
            toDoRepository: RepositoryProvider.of<ToDoRepository>(context)),
        uploadToDoEntry: UpdateToDoEntry(
            toDoRepository: RepositoryProvider.of<ToDoRepository>(context)),
      )..fetch(),
      child: const ToDoEntryItem(),
    );
  }
}

class ToDoEntryItem extends StatelessWidget {
  const ToDoEntryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoEntryItemCubit, TodoEntryItemState>(
        builder: (context, state) {
      if (state is TodoEntryItemLoadingState) {
        return const ToDoEntryItemLoading();
      } else if (state is TodoEntryItemLoadedState) {
        return ToDoEntryItemLoaded(
          onChanged: (value) => context.read<TodoEntryItemCubit>().update(),
          entryItem: state.toDoEntry,
        );
      } else {
        return const ToDoEntryItemError();
      }
    });
  }
}
