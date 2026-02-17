import 'package:flutter/material.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_delegate.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('RootScreen')),
        body:  Center(child: Column(
          children: [
            ElevatedButton(onPressed: (){
              (Router.of(context).routerDelegate as MyRouteDelegate).setNewRoutePath('/home');
            }, child: Text('HomeScreen')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
               (Router.of(context).routerDelegate as MyRouteDelegate).setNewRoutePath('/profile');
            }, child: Text('Profile'))
          ],
        )));
  }
}