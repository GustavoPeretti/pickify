import 'package:flutter/material.dart';
import 'package:pickify/database/dao/playlist.dart';
import 'package:pickify/model/playlist.dart';
import 'package:pickify/model/track.dart';
import 'package:pickify/pages/dashboard.dart';
import 'package:pickify/widgets/default_scaffold.dart';

class LastTrack extends StatefulWidget {
  final Playlist playlist;
  final Track track;

  const LastTrack({super.key, required this.playlist, required this.track});

  @override
  State<LastTrack> createState() => _LastTrackState();
}

class _LastTrackState extends State<LastTrack> {
  @override
  void initState() {
    super.initState();
    registerFavorite(widget.playlist.id, widget.track.id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Você encontrou sua música preferida!', style: TextStyle(fontSize: 24, ), textAlign: TextAlign.center,),
          const SizedBox(height: 16,),
          Image.network(widget.track.image, fit: BoxFit.cover, width: 300, height: 300,),
          const SizedBox(height: 32,),
          Text(widget.track.title),
          Text(widget.track.artist, style: const TextStyle(fontSize: 20, color: Colors.grey),),
          Text(widget.track.formattedDuration, style: const TextStyle(fontSize: 20, color: Colors.grey),),
          const SizedBox(height: 32,),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Dashboard()), (route) => false,);
            },
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Color(0xFF1FB855)),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
            child: const Text('Voltar', style: TextStyle(color: Colors.white),)
          ),
        ]
      ),
    );
  }
}