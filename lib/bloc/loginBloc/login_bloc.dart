import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_movie_app/bloc/loginBloc/login_event.dart';
import 'package:bloc_movie_app/bloc/loginBloc/login_state.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<LoginApi>(_loginApi);
  }
  void _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    Map data = {'email': state.email, 'password': state.password};

    try {
      final response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(
            loginStatus: LoginStatus.success, message: 'login successful'));
      } else {
        emit(state.copyWith(
            loginStatus: LoginStatus.failure, message: body['error']));
      }
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.failure, message: e.toString()));
    }
  }
}
