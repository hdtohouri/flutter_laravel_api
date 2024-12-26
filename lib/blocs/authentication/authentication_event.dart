part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class Namechanged extends AuthenticationEvent{
  Namechanged(this.name);
  final String name;
}
final class Emailchanged extends AuthenticationEvent{
  Emailchanged(this.email);
  final String email;
}
final class Passwordchanged extends AuthenticationEvent{
  Passwordchanged(this.password);
  final String password;
}
final class PasswordConfirmchanged extends AuthenticationEvent{
  PasswordConfirmchanged(this.password_confirm);
  final String password_confirm;
}
final class FormSubmit extends AuthenticationEvent{}

final class LogInUser extends AuthenticationEvent{}