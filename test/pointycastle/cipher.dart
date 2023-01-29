import 'dart:typed_data';

import 'package:kore/src/base64.dart';
import 'package:kore/src/util.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes.dart';
import 'package:pointycastle/block/modes/gcm.dart';
import 'package:test/test.dart';

import '../constant.dart';
import 'hash.dart';

void main() {
  group('AES256-GSM', () {
    Stopwatch stopwatch = Stopwatch()..start();
    final validKey = pcSha256(kToUInt8List(key));
    late Uint8List encrypted;
    test('encrypt', () async {
      final cipher = GCMBlockCipher(AESEngine())
        ..init(
            true,
            AEADParameters(
                KeyParameter(validKey), 128, iv12, Uint8List.fromList([])));
      encrypted = cipher.process(kToUInt8List(text));
      print(kBase64.encode(kFromIntList(encrypted)));
    });
    test('decrypt', () async {
      final cipher = GCMBlockCipher(AESEngine())
        ..init(
            true,
            AEADParameters(
                KeyParameter(validKey), 128, iv12, Uint8List.fromList([])));
      final decrypted = cipher.process(encrypted);
      print(kFromIntList(decrypted.sublist(0, decrypted.length - 32)));
      print('Elapsed time: ${stopwatch.elapsed}');
    });
  });
}
