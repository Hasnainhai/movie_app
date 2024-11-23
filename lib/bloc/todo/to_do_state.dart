part of 'to_do_bloc.dart';

class ToDoState extends Equatable {
  const ToDoState({this.todoList = const []});
  final List<String> todoList;
  ToDoState copyWith({List<String>? todoList}) {
    return ToDoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object> get props => [todoList];
}
