import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authevent.dart';
part 'authstate.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  void _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}