import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> toDoList = [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addToDoEvent);
    on<RemoveTodoEvent>(_removeToDoEvent);
  }
  void _addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emit) {
    toDoList.add(event.task);
    emit(state.copyWith(todoList: List.from(toDoList)));
  }

  void _removeToDoEvent(RemoveTodoEvent event, Emitter<ToDoState> emit) {
    toDoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(toDoList)));
  }
}
