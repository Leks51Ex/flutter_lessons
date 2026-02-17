import 'package:flutter_stepik/network/http/test_project/interceptors/http_interceptor.dart';
import 'package:http/src/base_request.dart';
import 'package:http/src/streamed_response.dart';

class LoggerInterceptor implements HttpInterceptor{
  @override
  void onRequest(BaseRequest request) {
  print('Отправляем ${request.method} запрос${request.url}');
  }

  @override
  void onResponse(StreamedResponse response) {
     print('Статус ответа от сервера:${response.statusCode}');
  }
}