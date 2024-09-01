import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../../../../injectible.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final _todoBloc = getIt<TodoBloc>();
  @override
  void initState() {
    _todoBloc.add(TodoFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // final dio = Dio();
              // dio.options.headers['Demo-Header'] = 'demo header';
              // final client = RestClient(dio);
              // debugPrint('Client: $client');

              // client.getTasks().then((it) => print(it));
            },
          ),
        ],
        centerTitle: false,
        title: Text('Todo', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: _todoBloc,
        builder: (context, state) {
          if (state.status == ToDoStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ToDoStatus.failed) {
            return Center(child: Text(state.message ?? ''));
          } else if (state.status == ToDoStatus.success) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 1,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
                  child: CheckboxListTile(
                    title: Text(state.todoList![index].title ?? ''),
                    value: state.todoList![index].completed,
                    onChanged: (bool? value) {
                      _todoBloc.add(
                        TodoUpdated(
                          state.todoList![index].copyWith(completed: value),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: state.todoList!.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
