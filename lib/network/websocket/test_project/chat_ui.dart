import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_stepik/network/websocket/test_project/client_ui.dart';
import 'package:flutter_stepik/network/websocket/test_project/server_ui.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final channel = WebSocketChannel.connect(Uri.parse('ws://localhost:8080/ws/chat'));
  
  
  StreamSubscription<dynamic>? _subscription;
  final _controller = TextEditingController();
  final _clientMessages = <String>[];
  final _serverMessages = <String>[];
  
  _sendMessages(){
    if (_controller.text.isNotEmpty) {
      setState(() {
        _clientMessages.add(_controller.text);
      });
      channel.sink.add(_controller.text);
      _controller.clear();
    }
  }
  
  @override
  void dispose() {
channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Чат'),),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(child: Row(
            children: [
              ServerMessages(channel: channel, serverMessages: _serverMessages, onNewMessages: _serverMessages.add),
              SizedBox(width: 20,),
              ClientMessages(clientMessages: _clientMessages),
            ],
          )),
          Padding(padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Expanded(child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Введите свое сообщение',
                ),
              )),
              IconButton(onPressed: _sendMessages, icon: Icon(Icons.send))
            ],
          ),
          ),
          
        ],
      ),
      ),
    );
  }
}