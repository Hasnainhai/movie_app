import 'package:bloc_movie_app/bloc/loginBloc/login_bloc.dart';
import 'package:bloc_movie_app/bloc/loginBloc/login_event.dart';
import 'package:bloc_movie_app/bloc/loginBloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  late LoginBloc _loginBloc;
  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (current, previous) => current.email != previous.email,
              builder: (context, state) {
                return TextField(
                  focusNode: _emailFocusNode,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email'),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(EmailChanged(email: value));
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (current, previous) =>
                  current.password != previous.password,
              builder: (context, state) {
                return TextField(
                  focusNode: _passwordFocusNode,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password'),
                  onChanged: (value) {
                    context
                        .read<LoginBloc>()
                        .add(PasswordChanged(password: value));
                  },
                );
              },
            ),
            const SizedBox(height: 40),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.loginStatus == LoginStatus.failure) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(state.message)));
                }
                if (state.loginStatus == LoginStatus.loading) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(content: Text('Loding...')));
                }
                if (state.loginStatus == LoginStatus.success) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        const SnackBar(content: Text('Login success')));
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (current, previous) => false,
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginApi());
                      },
                      child: const Text('Login'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
