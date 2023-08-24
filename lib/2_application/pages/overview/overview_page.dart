import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cleanarch/1_domain/use_cases/load_overview_collection.dart';
import 'package:todo_cleanarch/2_application/pages/overview/bloc/cubit/todo_overview_cubit.dart';
import 'package:todo_cleanarch/2_application/pages/overview/view_states/todo_overview_error.dart';
import 'package:todo_cleanarch/2_application/pages/overview/view_states/todo_overview_loaded.dart';
import 'package:todo_cleanarch/2_application/pages/overview/view_states/todo_overview_loading.dart';

import '../../core/page_config.dart';

class OverviewPageProvider extends StatelessWidget {
  const OverviewPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDoOverviewCubit(
        loadToDoCollection: LoadToDoCollection(
          toDoRepository: RepositoryProvider.of(context),
        ),
      )..readToDoCollection(),
      child: const OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'overview',
    child: OverviewPageProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: BlocBuilder<ToDoOverviewCubit, ToDoOverviewCubitState>(
          builder: (context, state) {
        if (state is ToDoOverviewCubitLoadingState) {
          return const ToDoOverviewLoading();
        } else if (state is ToDoOverviewCubitLoadedState) {
          return ToDoOverviewLoaded(collection: state.collection);
        } else {
          return const ToDoOverviewError();
        }
      }),
    );
  }
}
