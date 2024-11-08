import 'package:flutter/material.dart';
import 'package:pickify/widgets/scaffold.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPadrao(
      body: Column(
        children: [
          Text('PICKIFY', style: TextStyle(color: Color.fromARGB(30, 185, 85, 1),))
        ],
      ),
    );
  }
}