
import 'package:flutter/material.dart';
import 'package:flutter_stepik/network/http/http_client.dart';
import 'package:flutter_stepik/network/http/test_project/interceptors/logger_interceptor.dart';
import 'package:http/http.dart' as http;

class HomeScreenInterceptor extends StatefulWidget {
  const HomeScreenInterceptor({super.key});

  @override
  State<HomeScreenInterceptor> createState() => _HomeScreenInterceptorState();
}

class _HomeScreenInterceptorState extends State<HomeScreenInterceptor> {
  

  final _client = HttpInterceptorClient(
       http.Client(),
       interceptor: LoggerInterceptor(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
          await _client.get(Uri.parse('http://localhost:8080/hello'));
          },
          child: const Text('Отправить запрос'),
        ),
      ),
    );
  }
}