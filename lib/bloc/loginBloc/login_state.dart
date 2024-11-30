import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final String email;
  final String password;
  final String message;
  const LoginState({
    this.loginStatus = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.message = '',
  });
  LoginState copyWith(
      {LoginStatus? loginStatus,
      String? email,
      String? password,
      String? message}) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [loginStatus, email, password, message];
}
