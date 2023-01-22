import 'dart:typed_data';

import 'package:universal_io/io.dart';

late final ServerSocket _server;

Future<void> kStartServer() async {
  _server = await ServerSocket.bind(InternetAddress.anyIPv4, 4567);
  _server.listen((client) {
    _handleConnection(client);
  });
}

void _handleConnection(Socket client) {
  client.listen(
    (Uint8List data) async {
      final message = String.fromCharCodes(data);
      client.write(message);
    },
    onError: (error) {
      print(error);
      client.close();
    },
    onDone: () {
      client.close();
    },
  );
}
