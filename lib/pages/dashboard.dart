import 'package:flutter/material.dart';
import 'package:pickify/database/dao/playlist.dart';
import 'package:pickify/model/playlist.dart';
import 'package:pickify/model/track.dart';
import 'package:pickify/pages/playlist_details.dart';
import 'package:pickify/pages/playlist_search.dart';
import 'package:pickify/widgets/default_scaffold.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Center(
            child: Text('Playlists avaliadas', style: TextStyle(fontSize: 26),),
          ),
          FutureBuilder(
            future: getFavoritesWithDetails(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text(
                        'Não foi possível ler os cadastros da base de dados.'),
                  );
                case ConnectionState.waiting:
                  return const Center(
                      child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Center(
                      child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (!snapshot.hasData) {
                    return Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaylistSearch()));
                        },
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(Color(0xFF1FB855)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                        ),
                        child: const Text('Avaliar playlists', style: TextStyle(color: Colors.white),)
                      ),
                    );
                  }

                  debugPrint(snapshot.data.toString());

                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Map<String, Object> pair = snapshot.data![index] as Map<String, Object>;

                      Playlist playlist = pair['playlist'] as Playlist;
                      Track track = pair['track'] as Track;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistDetails(playlist: playlist, track: track,)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            child: Container(
                              width: double.infinity,
                              color: Colors.grey[900],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(playlist.image, fit: BoxFit.cover),
                                  const SizedBox(width: 8,),
                                  Expanded(child: Text(playlist.title, style: const TextStyle(fontSize: 16,), overflow: TextOverflow.ellipsis, maxLines: 2,))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  );
              }
            }
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaylistSearch()));
        },
        backgroundColor: const Color.fromARGB(255, 30, 185, 84),
        shape: const CircleBorder(),
        child: const Text('VS', style: TextStyle(color: Colors.black, fontFamily: 'Rubik', fontSize: 26),),
      ),
    );
  }
}