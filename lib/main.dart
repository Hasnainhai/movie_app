import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final student = Student(studentName: 'hasnain', studentAge: 21);
          final student1 = Student(studentName: 'hasnain', studentAge: 21);
          print(student == student1);
          print(student.hashCode.toString());
          print(student1.hashCode.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Student extends Equatable {
  final String studentName;
  final int studentAge;
  Student({required this.studentName, required this.studentAge});

  @override
  List<Object?> get props => [studentName, studentAge];
}
