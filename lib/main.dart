import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.rudaTextTheme(),
        scaffoldBackgroundColor: const Color.fromRGBO(8, 8, 8, 1)
      ),
    );
  }
}
