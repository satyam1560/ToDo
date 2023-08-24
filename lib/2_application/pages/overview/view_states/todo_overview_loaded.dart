import 'package:flutter/material.dart';
import 'package:todo_cleanarch/1_domain/entities/todo_collection.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  const ToDoOverviewLoaded({super.key, required this.collection});

  final List<ToDoCollection> collection;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: collection.length,
        itemBuilder: (context, index) {
          final item = collection[index];
          final colorScheme = Theme.of(context).colorScheme;

          return ListTile(
            tileColor: colorScheme.surface,
            selectedTileColor: colorScheme.surfaceVariant,
            iconColor: item.color.color,
            selectedColor: item.color.color,
            onTap: () => debugPrint(item.title),
            leading: const Icon(Icons.circle),
            title: Text(item.title),
          );
        });
  }
}
