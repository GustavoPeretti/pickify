// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  Widget? body;
  Widget? floatingActionButton;

  DefaultScaffold({super.key, this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'PICKIFY',
          style: TextStyle(
            fontFamily: 'Bungee',
            fontSize: 26,
            color: Color.fromARGB(255, 30, 185, 84)
          ),
        ),
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}