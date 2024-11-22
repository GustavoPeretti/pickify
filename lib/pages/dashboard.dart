import 'package:flutter/material.dart';
import 'package:pickify/pages/playlist.dart';
import 'package:pickify/widgets/scaffold.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final List<String> names = [
    "olavo de carvalho",
    "absolute cinema",
    "musicas para churrasco",
    "voltar do ifc",
    "soh seleção",
    "Ver mais",
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPadrao(
      temAppbar: true,
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Playlists Avaliadas",
                  style: TextStyle(
                      fontFamily: 'Ruda', color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 15),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 4.2,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    if (index < 5) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              child: Image.network(
                                'https://i.pinimg.com/736x/7d/3c/4a/7d3c4aa659d8d8ba07a914ddb1a6b7b9.jpg', // Substitua pela sua imagem
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  names[index], // Texto que será exibido
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 31, 184, 85),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.format_list_bulleted,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    "Ver mais",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Image.asset('assets/img/capa-playlist-pickify.png',
                              height: 130),
                          SizedBox(height: 10),
                          Text(
                            "Pickify",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            "Playlist",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/img/primeiro-lugar.png',
                            height: 35,
                          ),
                          SizedBox(height: 10),
                          Image.network(
                              'https://akamai.sscdn.co/uploadfile/letras/albuns/c/c/2/8/19415.jpg',
                              height: 130),
                          SizedBox(height: 10),
                          Container(
                            width: 130,
                            child: Column(children: [
                              Text(
                                "I Want to Know What Love Is",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Foreigner",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ]),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 31, 184, 85),
              shape: CircleBorder(side: BorderSide.none),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Playlist()),
                );
              },
              child: Text(
                "+VS",
                style: TextStyle(
                    fontFamily: 'Rubik', color: Colors.black, fontSize: 22),
              ),
            )
    );
  }
}
