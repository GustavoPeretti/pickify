import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pickify/model/playlist.dart';
import 'package:pickify/model/track.dart';
import 'package:pickify/pages/last_track.dart';
import 'package:pickify/widgets/default_scaffold.dart';

class Duel extends StatefulWidget {
  final Playlist playlist;

  const Duel({super.key, required this.playlist});

  @override
  State<Duel> createState() => _DuelState();
}

class _DuelState extends State<Duel> {
  late List<Track> tracks;
  late List<Track> current;
  late Track firstTrack;
  late Track secondTrack;

  @override
  void initState() {
    super.initState();
    tracks = List.from(widget.playlist.tracks);
    current = [];
    _selectRandomTracks();
  }

  void _selectRandomTracks() {
    debugPrint(tracks.toString());

    if (tracks.length > 1) {
      Random random = Random();
      
      int firstTrackIndex = random.nextInt(tracks.length);
      int secondTrackIndex = random.nextInt(tracks.length);

      while (secondTrackIndex == firstTrackIndex) {
        secondTrackIndex = random.nextInt(tracks.length);
      }

      firstTrack = tracks[firstTrackIndex];
      secondTrack = tracks[secondTrackIndex];

      if (firstTrackIndex < secondTrackIndex) {
        tracks.removeAt(secondTrackIndex);
        tracks.removeAt(firstTrackIndex);
      } else {
        tracks.removeAt(firstTrackIndex);
        tracks.removeAt(secondTrackIndex);
      }

      current.add(firstTrack);
      current.add(secondTrack);

      setState(() {});

      return;
    }

    if (tracks.isNotEmpty) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LastTrack(playlist: widget.playlist, track: tracks.first,)), (route) => false,);
    }
  }

  void _chooseTrack(Track chosenTrack) {
    if (chosenTrack == firstTrack) {
      current.removeAt(1);
      tracks.add(current.first);
    } else {
      current.removeAt(0);
      tracks.add(current.first);
    }

    current.clear();
    
    _selectRandomTracks();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _chooseTrack(firstTrack);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(firstTrack.image, fit: BoxFit.cover, width: 160, height: 160,),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(firstTrack.title, style: const TextStyle(fontSize: 24, overflow: TextOverflow.ellipsis), maxLines: 2),
                          Text(firstTrack.artist, style: const TextStyle(fontSize: 20, color: Colors.grey, overflow: TextOverflow.ellipsis), maxLines: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(firstTrack.formattedDuration, style: const TextStyle(fontSize: 20, color: Colors.grey),),
                              const SizedBox(width: 16,),
                              Visibility(
                                visible: firstTrack.explicit,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Text('Explícito', style: TextStyle(fontSize: 16, color: Colors.white, ),),
                                ),
                              )
                            ],
                          )
                                      
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Text('VS', style: TextStyle(fontFamily: 'Bungee', fontSize: 32),),
              GestureDetector(
                onTap: () {
                  _chooseTrack(secondTrack);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(secondTrack.image, fit: BoxFit.cover, width: 160, height: 160,),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(secondTrack.title, style: const TextStyle(fontSize: 24, overflow: TextOverflow.ellipsis), maxLines: 2),
                          Text(secondTrack.artist, style: const TextStyle(fontSize: 20, color: Colors.grey, overflow: TextOverflow.ellipsis), maxLines: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(secondTrack.formattedDuration, style: const TextStyle(fontSize: 20, color: Colors.grey),),
                              const SizedBox(width: 16,),
                              Visibility(
                                visible: secondTrack.explicit,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: const Text('Explícito', style: TextStyle(fontSize: 16, color: Colors.white, ),),
                                ),
                              )
                            ],
                          )
                                      
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}