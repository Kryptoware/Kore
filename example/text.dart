import 'package:kore/kore.dart';

void main() async {
  const text = "my test text";
  const key = "SecretSecretSecretSecretSecret12";
  final cipherText = kEncodeText(await kEncryptText(text, key));
  print(cipherText);
  final plainText = await kDecryptText(kDecodeText(cipherText), key);
  print(plainText);
}
