import 'package:equatable/equatable.dart';

class TodoState extends Equatable{
  final List<String> todoList;

  const TodoState({
    this.todoList = const []
});

  @override
  List<Object?> get props => [todoList];
}