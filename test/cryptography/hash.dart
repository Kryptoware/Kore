import 'package:convert/convert.dart';
import 'package:cryptography/cryptography.dart';
import 'package:kore/src/util.dart';
import 'package:test/test.dart';

import '../constant.dart';

void main() {
  group('SHA256', () {
    Stopwatch stopwatch = Stopwatch()..start();
    test('encode', () async {
      expect(hash == hex.encode(await cgSha256(kToIntList(text))), isTrue);
    });
    print('Elapsed time: ${stopwatch.elapsed}');
  });
}

Future<List<int>> cgSha256(List<int> data) async {
  final algorithm = Sha256();
  final sink = algorithm.newHashSink();
  sink.add(data);
  sink.close();
  return (await sink.hash()).bytes;
}
