import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pickify/auth/auth.dart';

class Track {
  String id;
  String title;
  String artist;
  Duration duration;
  String image;
  bool explicit;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.image,
    required this.explicit
  });

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      id: map['id'],
      title: map['name'],
      artist: map['artists'][0]['name'],
      duration: Duration(milliseconds: map['duration_ms']),
      image: map['album']['images'][0]['url'],
      explicit: map['explicit']
    );
  }

  String get formattedDuration {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static Future<Track> fromId(String trackId) async {
    http.Response response = await getRequestSpotify('https://api.spotify.com/v1/tracks/$trackId');

    if (response.statusCode != 200) {
      throw Exception('Error loading track');
    }

    String id = json.decode(response.body)['id'];
    String title = json.decode(response.body)['name'];
    String artist = json.decode(response.body)['artists'][0]['name'];
    int duration = json.decode(response.body)['duration_ms'];
    String image = json.decode(response.body)['album']['images'][0]['url'];
    bool explicit = json.decode(response.body)['explicit'];

    return Track(id: id, title: title, artist: artist, duration: Duration(milliseconds: duration), image: image, explicit: explicit);
  }
}