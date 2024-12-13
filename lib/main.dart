import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pickify/auth/auth.dart';
import 'package:pickify/pages/dashboard.dart';
import 'package:pickify/storage/storage.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  
  if (!(await storage.containsKey(key: 'access_token'))) {
    storage.write(key: 'access_token', value: await getToken());
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: const MaterialColor(
          0xFF1FB855,
          <int, Color>{
            50: Color(0xFFE5F6EB),
            100: Color(0xFFBFEBD0),
            200: Color(0xFF94DEB3),
            300: Color(0xFF69D096),
            400: Color(0xFF47C57F),
            500: Color(0xFF1FB855),
            600: Color(0xFF2AAF7D),
            700: Color(0xFF239964),
            800: Color(0xFF1D834F),
            900: Color(0xFF136334),
          },
        ),
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Ruda', 
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(8, 8, 8, 1)
      ),
      home: const Dashboard(),
    );
  }
}
