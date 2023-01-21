import 'package:kore/kore.dart';

void main() async {
  const text = "my test text";
  const secret = "SecretSecretSecretSecretSecret12";
  final cipherText = kEncodeText(await kEncryptText(text, secret));
  print(cipherText);
  final plainText = await kDecryptText(kDecodeText(cipherText), secret);
  print(plainText);
}
