import 'package:flutter/material.dart';

class ScaffoldPadrao extends StatelessWidget {
  Widget? body;
  bool temConfiguracoes;

  ScaffoldPadrao({super.key, this.body, this.temConfiguracoes = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Triolingo',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 251, 183),
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: temConfiguracoes
            ? [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Placeholder()));
                    },
                    icon: const Icon(Icons.settings))
              ]
            : null,
        backgroundColor: const Color.fromARGB(255, 79, 41, 88),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 251, 183)),
      ),
      body: body,
    );
  }
}