import 'package:bloc_movie_app/bloc/imagePickerBloc/image_picker_bloc.dart';
import 'package:bloc_movie_app/bloc/switchBloc/switch_bloc.dart';
import 'package:bloc_movie_app/bloc/todo/to_do_bloc.dart';
import 'package:bloc_movie_app/ui/todo/todo_screen/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counteBloc/counter_bloc.dart';
import 'utils/image_picker_utils.dart';

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
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (_) => ToDoBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
