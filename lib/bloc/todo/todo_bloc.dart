import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/todo/todo_event.dart';
import 'package:counter_bloc/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];

  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<DeleteTodoEvent>(_deleteTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.todo);
    emit(state.copyWith(todos: List.from(todoList)));
  }

  void _deleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) {
    todoList.remove(event.todo);
    emit(state.copyWith(todos: List.from(todoList)));
  }
}
