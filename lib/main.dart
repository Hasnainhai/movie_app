import 'package:bloc_movie_app/bloc/favouriteApp/favourite_app_bloc.dart';
import 'package:bloc_movie_app/bloc/imagePickerBloc/image_picker_bloc.dart';
import 'package:bloc_movie_app/bloc/postsBloc/posts_bloc.dart';
import 'package:bloc_movie_app/bloc/switchBloc/switch_bloc.dart';
import 'package:bloc_movie_app/bloc/todo/to_do_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/favourite_repository.dart';
import 'ui/login/login_Screen.dart';
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
        // BlocProvider(
        //   create: (_) => CounterBloc(),
        // ),
        BlocProvider(
          create: (_) => SwitchBloc(),
        ),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (_) => ToDoBloc(),
        ),
        BlocProvider(
          create: (_) => FavouriteAppBloc(FavouriteRepository()),
        ),
        BlocProvider(
          create: (_) => PostsBloc(),
        ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
