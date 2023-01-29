import 'dart:convert' as convert;

final convert.Codec<String, String> kBase64 = convert.utf8.fuse(convert.base64);
