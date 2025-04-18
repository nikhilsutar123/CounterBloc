import 'package:equatable/equatable.dart';

class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final String todo;

  const AddTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final Object todo;

  const DeleteTodoEvent({required this.todo});

  @override
  List<Object?> get props => [];
}
