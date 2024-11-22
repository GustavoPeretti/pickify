import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Map<String, String> getAuthCodes() {
  String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

  String codeVerifier = List.generate(128, (i) => [Random.secure().nextInt(characters.length)]).join();

  Digest hashedCodeVerifier = sha256.convert(utf8.encode(codeVerifier));

  String codeChallenge = base64Encode(hashedCodeVerifier.bytes);

  return {
    'codeVerifier': codeVerifier,
    'codeChallenge': codeChallenge
  };
}

Map<String, String> codes = getAuthCodes();
String codeVerifier = codes['codeVerifier']!;
String codeChallenge = codes['codeChallenge']!;

Future generateAuthorizationURL() async {
  String url = 'https://accounts.spotify.com/authorize?';
  url += 'response_type=code';
  url += 'client_id=${dotenv.env['CLIENT_ID']}';
  url += 'redirect_uri=${dotenv.env['REDIRECT_URI']}';
  url += 'code_challenge_method=S256';
  url += 'code_challenge=$codeChallenge';

  return url;
}
