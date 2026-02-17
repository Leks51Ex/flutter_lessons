import 'package:http/http.dart' as http;

abstract interface class HttpInterceptor {
  void onRequest(http.BaseRequest request);

  void onResponse(http.StreamedResponse response);
}