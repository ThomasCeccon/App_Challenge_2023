import 'dart:async';
import 'dart:convert';
import 'dart:io';

void connect2(StreamController<String> stream) async {
  try {
    // Para utilizar esse exemplo com o traffic_analyzer_v2.py, remova as linhas 8-9
    var futures = <Future>[];
    futures.add(handleSocketConnection(50000, stream));
    // futures.add(handleSocketConnection(50001));
    // futures.add(handleSocketConnection(50002));
    await Future.wait(futures);
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> handleSocketConnection(
    int port, StreamController<String> streamController) async {
  try {
    var socket = await Socket.connect('localhost', port);
    print('Connected to port $port.');

    await for (var data in socket) {
      String receivedData = String.fromCharCodes(data);
      //print(receivedData);
      receivedData = receivedData.substring(1);
      receivedData = receivedData.replaceAll("'", "");
      //print(receivedData);
      var json = jsonDecode(receivedData);
      //print('Received from port $port: $receivedData');
      streamController.add(jsonEncode(json));
    }
  } catch (e) {
    print('Error in connection to port $port: $e');
  }
}
