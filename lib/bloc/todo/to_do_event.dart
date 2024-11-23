import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddToDoEvent extends ToDoEvent {
  final String task;
  const AddToDoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

final class RemoveTodoEvent extends ToDoEvent {
  final Object task;
  const RemoveTodoEvent({required this.task});
  @override
  List<Object?> get props => [task];
}
