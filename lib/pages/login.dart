import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pickify/widgets/scaffold.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPadrao(
      temAppbar: false,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.bungee(textStyle: const TextStyle(
                    fontSize: 42,
                    color: Color.fromARGB(255, 30, 185, 84)
                    )),
                  children: [ 
                    TextSpan(text: 'PICKIFY\n'),
                    TextSpan(text: "dividir para conquistar", style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 2,)) ]
                  ), 
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}