import 'package:flutter/material.dart';

class ImpNavHomeScreen extends StatelessWidget {
  const ImpNavHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
      }, child: Text('Go to detail screen')),
    );
  }
}



class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Detail screen'),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Go back'))
          ],
        ),
      ),
    );
  }
}