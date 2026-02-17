import 'package:flutter/material.dart';

class ClientMessages extends StatelessWidget {
  const ClientMessages({super.key, required clientMessages}): _clientMessages = clientMessages;
  

  final List<String> _clientMessages;
  
  
  @override
  Widget build(BuildContext context) {
    return  Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Мои сообщения', style: TextStyle(fontWeight: FontWeight.bold),),
         Expanded(child: ListView.builder(
          itemCount: _clientMessages.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(_clientMessages[index]),
            );
          },
         ))
      ],
    ));
  }
}