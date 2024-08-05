import 'dart:convert';

import 'package:crypto/crypto.dart';

String getEncrypt(String arg) {
  var bytes = utf8.encode(arg); // data being hashed

  var digest = sha256.convert(bytes);

  print("Digest as bytes: ${digest.bytes}");
  print("Digest as hex string: $digest");
  print(digest.toString());
  return digest.toString();
}