// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'customformfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(),
                SizedBox(height: 24),
                _Form(),
                SizedBox(height: 71),
                _SignInButton(),
                SizedBox(height: 27),
                _Social(),
                SizedBox(height: 16),
                _SignUp(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign In',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Enter your credetials to continue'),
      ],
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        CustomFormField(label: 'Email', hint: 'Enter Your Email'),
        SizedBox(height: 24),
        CustomFormField(
            label: 'Password', hint: "Enter Your Password", isPassword: true),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text('Forgot Password?',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                )),
          ),
        )
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 57,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create_account');
          },
          child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                TextSpan(text: "Don't have an account?"),
                TextSpan(
                  text: " Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blueAccent),
                )
              ]))),
    );
  }
}

class _Social extends StatelessWidget {
  const _Social({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "OR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              icon: Icons.facebook,
              color: Colors.blue,
            ),
            SizedBox(width: 16),
            _SocialButton(
              icon: Icons.discord,
              color: Colors.blueAccent,
            ),
          ],
        )
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _SocialButton({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(
          icon,
          color: color,
          size: 32,
        ),
      ),
    );
  }
}
