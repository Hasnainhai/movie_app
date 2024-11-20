import 'package:bloc_movie_app/bloc/switchBloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counteBloc/counter_bloc.dart';
import 'ui/switch_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (_) => SwitchBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SwitchExample(),
      ),
    );
  }
}


   // final student = Student(studentName: 'hasnain', studentAge: 21);
          // final student1 = Student(studentName: 'hasnain', studentAge: 21);
          // print(student == student1);
          // print(student.hashCode.toString());
          // print(student1.hashCode.toString());




          
// class Student extends Equatable {
//   final String studentName;
//   final int studentAge;
//   const Student({required this.studentName, required this.studentAge});

//   @override
//   List<Object?> get props => [studentName, studentAge];
// }
