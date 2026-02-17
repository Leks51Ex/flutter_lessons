import 'package:flutter_stepik/network/http/test_project/interceptors/http_interceptor.dart';
import 'package:http/http.dart' as http;

class HttpInterceptorClient  extends http.BaseClient{
  
  final http.Client _inner;
  final HttpInterceptor? interceptor;
  

  HttpInterceptorClient(this._inner, {
    this.interceptor
  });
  
  
  
  
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    interceptor?.onRequest(request);
    final response = await _inner.send(request);

    interceptor?.onResponse(response);
    return response;
  }
}