import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_event.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<DeleteTodoEvent>(_deleteTodo);
  }

  void _addTodo(TodoEvent event, Emitter<TodoState> emit) {}

  void _deleteTodo(TodoEvent event, Emitter<TodoState> emit) {}
}
