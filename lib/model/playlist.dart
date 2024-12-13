import 'dart:convert';

import 'package:pickify/auth/auth.dart';
import 'package:pickify/model/track.dart';
import 'package:http/http.dart' as http;

class Playlist {
  String id;
  String title;
  String owner;
  String image;
  List<Track> tracks;

  Playlist({
    required this.id,
    required this.title,
    required this.owner,
    required this.image,
    required this.tracks,
  });

  static Future<Playlist> fromId(String playlistId) async {
    http.Response response = await getRequestSpotify('https://api.spotify.com/v1/playlists/$playlistId');

    if (response.statusCode != 200) {
      throw Exception('Error loading playlist');
    }

    String id = json.decode(response.body)['id'];
    String title = json.decode(response.body)['name'];
    String owner = json.decode(response.body)['owner']['display_name'];
    String image = json.decode(response.body)['images'][0]['url'];

    List<Track> trackList = [];
    String url = 'https://api.spotify.com/v1/playlists/$playlistId/tracks';
    bool hasNext = true;
    String? nextUrl = url;

    while (hasNext) {
      http.Response response = await getRequestSpotify(nextUrl!);
        
      if (response.statusCode != 200) {
        throw Exception('Error loading playlist');
      }

      for (var item in json.decode(response.body)['items']) {
        Track track = Track.fromMap(item['track']);
        trackList.add(track);
      }

      nextUrl = json.decode(response.body)['next'];
      hasNext = nextUrl != null;
    }

    return Playlist(id: id, title: title, owner: owner, image: image, tracks: trackList);
  }
}