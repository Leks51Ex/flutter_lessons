import 'package:flutter/material.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_delegate.dart';

class ErrorDeclScreen extends StatelessWidget {
  const ErrorDeclScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ErrorScreen'),),
      body: Center(
        child: ElevatedButton(onPressed: (){
           (Router.of(context).routerDelegate as MyRouteDelegate)
                  .setNewRoutePath('/');
        }, child: Text('Root!')),
      ),
    );
  }
}