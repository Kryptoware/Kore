import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:kore/src/util.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:test/test.dart';

import '../constant.dart';

void main() {
  group('SHA256', () {
    Stopwatch stopwatch = Stopwatch()..start();
    test('encode', () {
      expect(hash == hex.encode(pcSha256(kToUInt8List(text))), isTrue);
      print('Elapsed time: ${stopwatch.elapsed}');
    });
  });
}

Uint8List pcSha256(Uint8List data) {
  final digest = SHA256Digest();
  return digest.process(data);
}
