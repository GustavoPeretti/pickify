import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScaffoldPadrao extends StatelessWidget {
  Widget? body;
  bool temPerfil;
  bool temSetinha;
  bool temAppbar;

  ScaffoldPadrao({super.key, this.body, this.temPerfil = true, this.temSetinha = true, this.temAppbar = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      temAppbar?
      AppBar(
        title: Text(
          'PICKIFY',
          style: GoogleFonts.bungee(textStyle: const TextStyle(
            fontSize: 26,
            color: Color.fromARGB(255, 30, 185, 84)
          )),
        ),
        centerTitle: true,
        actions: temPerfil
            ? [
                CircleAvatar(
                  child: Image.network('https://i.pinimg.com/736x/40/c4/70/40c47027e1a997ba18b290d6730e706b.jpg'),
                )
              ]
            : null,
        leading: temSetinha ?
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
            
          )
          : null,
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
        iconTheme:
            const IconThemeData(color: Color.fromRGBO(8, 8, 8, 1)
      ),
    ):null,
    body: body,
    );
  }
}