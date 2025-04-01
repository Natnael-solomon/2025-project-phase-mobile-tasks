part of 'authbloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends AuthEvent {
  final String email;
  const EmailChanged(this.email);
}

class PasswordChanged extends AuthEvent {
  final String password;
  const PasswordChanged(this.password);
}

class TogglePasswordVisibility extends AuthEvent {}