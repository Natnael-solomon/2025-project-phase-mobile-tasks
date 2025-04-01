import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authbloc.dart';
import 'authscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth BLoC Demo',
        initialRoute: '/auth',
        routes: {
          '/auth': (context) => const AuthScreen(),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}