import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ServerMessages extends StatelessWidget {
  const ServerMessages({super.key, required this.channel, required this.serverMessages, required this.onNewMessages});
  
  
  
  final WebSocketChannel channel;
  final List<String> serverMessages;
  final Function(String message) onNewMessages;


  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ответ', style: TextStyle(fontWeight: FontWeight.bold),),
        Expanded(child: StreamBuilder(stream: channel.stream, builder: (context, snapshot){
          if (snapshot.hasData) {
            onNewMessages(snapshot.data.toString());
          }
          return ListView.builder(
            itemCount: serverMessages.length,
            itemBuilder: (context, index){
            return ListTile(
              title: Text(serverMessages[index]),
            );
          });
        }))
      ],
    ));
  }
}