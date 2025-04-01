import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authbloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signin/signup')),
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: const AuthForm(),
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _EmailInput(),
          const SizedBox(height: 20),
          _PasswordInput(),
          SizedBox(height: 20),
          _AuthDataDisplay(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<AuthBloc>().add(EmailChanged(email)),
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) => context.read<AuthBloc>().add(PasswordChanged(password)),
          obscureText: !state.isPasswordVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () => context.read<AuthBloc>().add(TogglePasswordVisibility()),
            ),
          ),
        );
      },
    );
  }
}

class _AuthDataDisplay extends StatelessWidget {
  const _AuthDataDisplay();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            Text('Entered Email: ${state.email}'),
            Text('Entered Password: ${state.password}'),
          ],
        );
      },
    );
  }
}