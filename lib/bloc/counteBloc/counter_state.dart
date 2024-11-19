import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({this.count = 1});
  final int count;

  //second create a copywith fun
  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  // first from Equitable class
  @override
  List<Object?> get props => [count];
}
