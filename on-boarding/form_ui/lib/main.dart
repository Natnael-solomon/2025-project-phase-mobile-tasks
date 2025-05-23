// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'createacc.dart';
import 'signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        '/sign_in': (context) => SignIn(),
        '/create_account': (context) => CreateAcc(),
      },
    );
  }
}

