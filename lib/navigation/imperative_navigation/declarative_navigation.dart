import 'package:flutter/material.dart';


const bool _isAuth = true;


class DeclNav extends StatelessWidget {
  const DeclNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isAuth ? HomeScreen() : AuthScreen(),
    );
  }
}



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home screen'),
      ),
    );
  }
}



class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Auth screen'),
      ),
    );
  }
}