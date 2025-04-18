import 'package:counter_bloc/bloc/todo/todo_bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_event.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text(
                "No Todos found!",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(state.todoList[index],
                        style: const TextStyle(fontSize: 20)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context
                            .read<TodoBloc>()
                            .add(DeleteTodoEvent(todo: state.todoList[index]));
                      },
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 4; i++) {
            context.read<TodoBloc>().add(const AddTodoEvent(todo: "Todo Task"));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
