import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(SignUpPage());
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("Halaman Dashboard")),
      );
  }
}
