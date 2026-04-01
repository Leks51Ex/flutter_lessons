import 'package:flutter/material.dart';

class HeroPageOne extends StatelessWidget {
  const HeroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(tag: 'logo_widget_hero', child: FlutterLogo(size: 200)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => HeroPageTwo())),
      ),
    );
  }
}

class HeroPageTwo extends StatelessWidget {
  const HeroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo_widget_hero',
          child: FlutterLogo(size: MediaQuery.of(context).size.width),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => HeroPageOne())),
      ),
    );
  }
}
