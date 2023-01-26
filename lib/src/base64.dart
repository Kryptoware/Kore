import 'dart:convert' as convert;

final convert.Codec<String, String> base64 = convert.utf8.fuse(convert.base64);
