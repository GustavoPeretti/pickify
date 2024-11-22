import 'package:flutter/material.dart';
import 'package:pickify/widgets/scaffold.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPadrao(
      temAppbar: true,
    );
  }
}