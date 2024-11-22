import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pickify/widgets/scaffold.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPadrao(
      temAppbar: false,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'PICKIFY\n',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 30, 185, 84),
                            fontFamily: 'Bungee'),
                      ),
                      TextSpan(
                        text: 'dividir para conquistar',
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontFamily: 'Ruda',
                            letterSpacing: 6.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 58, 58, 58),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: Image.asset('assets/img/logo-spotify.png'),
                    title: Text('Login com Spotify', style: TextStyle(fontFamily: 'Ruda', fontSize: 18),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
