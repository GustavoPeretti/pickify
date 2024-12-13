// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pickify/model/playlist.dart';
import 'package:pickify/model/track.dart';
import 'package:pickify/pages/duel.dart';
import 'package:pickify/widgets/default_scaffold.dart';

class PlaylistDetails extends StatefulWidget {
  Playlist playlist;
  Track track;

  PlaylistDetails({super.key, required this.playlist, required this.track});

  @override
  State<PlaylistDetails> createState() => _PlaylistDetailsState();
}

class _PlaylistDetailsState extends State<PlaylistDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.network(widget.playlist.image, fit: BoxFit.cover, width: 200, height: 200,),
                Text(widget.playlist.title, style: const TextStyle(fontSize: 24),),
                Text(widget.playlist.owner, style: const TextStyle(fontSize: 20),)
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Color(0xFF1FB855),),
                Text('Música preferida', style: TextStyle(fontSize: 20),),
                Icon(Icons.star, color: Color(0xFF1FB855),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(widget.track.image, fit: BoxFit.cover, width: 120, height: 120,),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.track.title, style: const TextStyle(fontSize: 20),),
                    Text(widget.track.artist, style: const TextStyle(fontSize: 20, color: Colors.grey),)
                  ],
                )
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Duel(playlist: widget.playlist,)));
              },
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Color(0xFF1FB855)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
              ),
              child: const Text('Reavaliar playlist', style: TextStyle(color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
}