import 'package:flutter/material.dart';

class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(id ?? 'Нет переданных данных'),
      ),
    );
  }
}