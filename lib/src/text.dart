import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

final Codec<String, String> base64Codec = utf8.fuse(base64);

// todo replace with hash of secret key
final iv = Uint8List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,]);

// todo any key length
Future<List<int>> kEncryptText(String text, String key) async {
  final algorithm = AesCbc.with256bits(
    macAlgorithm: MacAlgorithm.empty,
  );
  final secretKey = await algorithm.newSecretKeyFromBytes(utf8.encode(key));
  final secretBox = await algorithm.encrypt(
      utf8.encode(text),
      secretKey: secretKey,
      nonce: iv
  );
  return secretBox.cipherText;
}

Future<String> kDecryptText(List<int> data, String key) async {
  final algorithm = AesCbc.with256bits(
    macAlgorithm: MacAlgorithm.empty,
  );
  final secretKey = await algorithm.newSecretKeyFromBytes(utf8.encode(key));
  final secretBox = SecretBox(data, nonce: iv, mac: Mac.empty);
  return utf8.decode(await algorithm.decrypt(
    secretBox,
    secretKey: secretKey,
  ));
}

String kEncodeText(List<int> data) {
  return base64Codec.encode(String.fromCharCodes(data));
}

List<int> kDecodeText(String data) {
  return base64Codec.decode(data).codeUnits;
}
