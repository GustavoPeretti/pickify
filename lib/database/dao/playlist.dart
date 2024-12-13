import 'package:pickify/database/db.dart';
import 'package:pickify/model/playlist.dart';
import 'package:pickify/model/track.dart';
import 'package:sqflite/sqflite.dart';

Future<List<Map<String, Object?>>> getFavorites() async {
  Database db = await getDatabase();

  List<Map<String, Object?>> data = await db.query('favorites');

  return data;
}

Future<List<Map<String, Object?>>> getFavoritesWithDetails() async {
  Database db = await getDatabase();

  List<Map<String, Object?>> data = await db.query('favorites');

  List<Map<String, Object>> pairs = await Future.wait(data.map((pair) async {
    try {
      final playlist = await Playlist.fromId(pair['id_playlist'] as String);
      final trackId = await Track.fromId(pair['id_track'] as String);
      return {
        'playlist': playlist,
        'track': trackId,
      };
    } catch (e) {
      return {};
    }
  }));

  return pairs;
}

Future<String?> getFavorite(String idPlaylist) async {
  Database db = await getDatabase();

  List<Map<String, Object?>> data = await db.query('favorites', where: 'id_playlist = ?', whereArgs: [idPlaylist]);

  if (data.isNotEmpty) {
    return data.first['id_track'] as String;
  }

  return null;
}

Future<int> registerFavorite(String idPlaylist, String idTrack) async {
  Database db = await getDatabase();

  if (await getFavorite(idPlaylist) != null) {
    return await db.update('favorites', {'id_track': idTrack}, where: 'id_playlist = ?', whereArgs: [idPlaylist]);
  }

  return await db.insert('favorites', {'id_playlist': idPlaylist, 'id_track': idTrack});
}