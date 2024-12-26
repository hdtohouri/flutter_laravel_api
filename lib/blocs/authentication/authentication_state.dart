part of 'authentication_bloc.dart';

enum FormStatus{
  initial,
  pending,
  success,
  error,
}
@immutable
final class AuthenticationState {
  const AuthenticationState({
    this.name ="",
    this.email ="",
    this.password ="",
    this.password_confirm ="",
    this.status = FormStatus.initial,
    this.errorMsg,
  });

  final String name;
  final String email;
  final String password;
  final String password_confirm;
  final FormStatus status;
  final String? errorMsg;

  AuthenticationState copyWith({
    String? name,
    String? email,
    String? password,
    String? password_confirm,
    FormStatus? status,
    String? errorMsg,
  }) => AuthenticationState(
    name: name ?? this.name ,
    email: email ?? this.email,
    password: password ?? this.password,
    password_confirm: password_confirm ?? this.password_confirm,
    status: status ?? this.status,
    errorMsg: errorMsg ?? this.errorMsg,
  );
}

//final class AuthenticationInitial extends AuthenticationState {}