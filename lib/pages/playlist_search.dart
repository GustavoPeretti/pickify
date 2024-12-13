import 'package:flutter/material.dart';
import 'package:pickify/model/playlist.dart';
import 'package:pickify/pages/duel.dart';
import 'package:pickify/widgets/default_scaffold.dart';

class PlaylistSearch extends StatefulWidget {
  const PlaylistSearch({super.key});

  @override
  State<PlaylistSearch> createState() => _PlaylistSearchState();
}

class _PlaylistSearchState extends State<PlaylistSearch> {
  String? _playlistID;
  String? _playlistTitle;
  String? _playlistOwner;
  String? _playlistImage;
  late Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                fillColor: Colors.white, 
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Insira o URL da playlist',
              hintStyle: TextStyle(color: Colors.grey),
              ),
              style: const TextStyle(color: Colors.black),
              onChanged: (value) async {
                Uri? uri = Uri.tryParse(value);

                if (uri == null || !uri.hasAbsolutePath) {
                  setState(() {
                    _playlistID = null;
                    _playlistTitle = null;
                    _playlistOwner = null;
                    _playlistImage = null;
                  });

                  return;
                }

                try {
                  playlist = await Playlist.fromId(uri.pathSegments.last.toString());
                } catch (e) {
                    _playlistID = null;
                    _playlistTitle = null;
                    _playlistOwner = null;
                    _playlistImage = null;
                }

                _playlistID = playlist.id;
                _playlistTitle = playlist.title;
                _playlistOwner = playlist.owner;
                _playlistImage = playlist.image;

                setState(() {});
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(_playlistImage ?? 'https://i.pinimg.com/736x/b8/fe/4c/b8fe4c9995c11c22662402e3bcf6fce4.jpg', fit: BoxFit.cover , width: 200, height: 200,),
                  const SizedBox(height: 4,),
                  Text(_playlistTitle ?? 'Playlist não encontrada', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700,),),
                  Text(_playlistOwner ?? 'Insira um URL', style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 8,),
                  Visibility(
                    visible: _playlistID != null,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Duel(playlist: playlist,)));
                      },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Color(0xFF1FB855)),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                      ),
                      child: const Text('Avaliar playlist', style: TextStyle(color: Colors.white),)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}