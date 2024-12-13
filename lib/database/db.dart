import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'pickify.db'),
    version: 1,
    onCreate: (db, version) {
      db.execute('CREATE TABLE favorites (id_playlist VARCHAR(255) NOT NULL, id_track VARCHAR(255) NOT NULL, PRIMARY KEY (id_playlist));');
    },
  );
}