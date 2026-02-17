import 'package:web_socket_channel/web_socket_channel.dart';

void main(List<String> args) {
  final writeUrl = Uri.parse('ws://localhost:8080/ws/write');
  final readUrl = Uri.parse('ws://localhost:8080/ws/read');
  
  
  
  final channel = WebSocketChannel.connect(writeUrl);
  channel.stream.listen((message){
    print(message);
  });
  channel.sink.add('Hello mutherfucker');
}