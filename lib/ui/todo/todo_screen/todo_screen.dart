import 'package:bloc_movie_app/bloc/todo/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/to_do_event.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          return state.todoList.isEmpty
              ? const Center(
                  child: Text('No data yet...'),
                )
              : state.todoList.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.todoList[index]),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<ToDoBloc>().add(
                                  RemoveTodoEvent(task: state.todoList[index]));
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      })
                  : const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print('towking.....');
          // for (int i = 0; i < 10; i++) {
          //   context
          //       .read<ToDoBloc>()
          //       .add(AddToDoEvent(task: 'task' + i.toString()));
          // }
        },
        child: IconButton(
          onPressed: () {
            for (int i = 0; i < 10; i++) {
              context.read<ToDoBloc>().add(AddToDoEvent(task: 'task$i'));
            }
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
