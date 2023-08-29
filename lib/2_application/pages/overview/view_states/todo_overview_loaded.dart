import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_cleanarch/1_domain/entities/todo_collection.dart';
import 'package:todo_cleanarch/2_application/pages/home/bloc/cubit/navigation_todo_cubit.dart';

import '../../detail/todo_detail_page.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  const ToDoOverviewLoaded({
    super.key,
    required this.collections,
  });

  final List<ToDoCollection> collections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;

        return BlocBuilder<NavigationTodoCubit, NavigationTodoCubitState>(
          buildWhen: (previous, current) =>
              previous.selectedCollectionId != current.selectedCollectionId,
          builder: (context, state) {
            return ListTile(
              tileColor: colorScheme.surface,
              selectedTileColor: colorScheme.surfaceVariant,
              iconColor: item.color.color,
              selectedColor: item.color.color,
              selected: state.selectedCollectionId == item.id,
              onTap: () {
                if (Breakpoints.small.isActive(context)) {
                  context.pushNamed(
                    ToDoDetailPage.pageConfig.name,
                    pathParameters: {'collectionId': item.id.value},
                  );
                }
                context
                    .read<NavigationTodoCubit>()
                    .selectedToDoCollectionChanged(item.id);
              },
              leading: const Icon(Icons.circle),
              title: Text(item.title),
            );
          },
        );
      },
    );
  }
}
