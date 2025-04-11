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
        builder: (BuildContext context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text("No Todos found!"),
            );
          }
          return ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(index.toString()),
                  trailing: const Icon(Icons.delete),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(const AddTodoEvent(todo: "Todo Task"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
