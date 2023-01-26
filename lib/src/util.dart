import 'dart:typed_data';

String kFromIntList(List<int> data) {
  return String.fromCharCodes(data);
}

List<int> kToIntList(String data) {
  return data.codeUnits;
}

Uint8List kToUInt8List(String data) {
  return Uint8List.fromList(kToIntList(data));
}
