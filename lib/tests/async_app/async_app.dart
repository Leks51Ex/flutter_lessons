import 'package:flutter/material.dart';

class AsyncApp extends StatefulWidget {
  const AsyncApp({super.key});

  @override
  State<AsyncApp> createState() => _AsyncAppState();
}

class _AsyncAppState extends State<AsyncApp> {
  Future<String>? _futureData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<String>(
                future: _futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Text(snapshot.data!);
                  }
                  return Text('Нужно загрузить данные');
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _futureData = _downloadData();
                  setState(() {});
                },
                child: Text('Загрузить данные'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _downloadData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Данные загружены';
  }
}
