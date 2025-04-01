part of 'authbloc.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;

  const AuthState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
  });

  AuthState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object> get props => [email, password, isPasswordVisible];
}