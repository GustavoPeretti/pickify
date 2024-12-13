import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pickify/storage/storage.dart';

Future<String> getToken() async {
  String authorization = base64.encode(utf8.encode('${dotenv.env['CLIENT_ID']}:${dotenv.env['CLIENT_SECRET']}'));

  http.Response response = await http.post(
    Uri.parse('https://accounts.spotify.com/api/token'),
    headers: {
      'Authorization': 'Basic $authorization',
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: {
      'grant_type': 'client_credentials'
    }
  );

  return json.decode(response.body)['access_token'];
}

Future<http.Response> getRequestSpotify(String url, [Map<String, String>? headers]) async {
  headers ??= {};
  headers['Authorization'] = 'Bearer ${await storage.read(key: 'access_token')}';

  http.Response response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 401) {
    storage.write(key: 'access_token', value: await getToken());

    return getRequestSpotify(url, headers);
  }

  return response;
}
