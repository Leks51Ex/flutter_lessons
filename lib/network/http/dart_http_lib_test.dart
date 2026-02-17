import 'dart:convert';
import 'package:http/http.dart' as http;




class TestDartHttp {



Future<void> fetchUsersList() async {
  final uri = Uri.parse('http://jsonplaceholder.typicode.com/users/8');

final response = await http.get(uri);


if (response.statusCode == 200) {
   final data = jsonDecode(response.body);
   final name = data['name'];
  print('hello my name is ${response.contentLength}');
}else {
  print('Failed to load data ${response.statusCode}');
}

}

}



void main(List<String> args) {
  final TestDartHttp httpClient = TestDartHttp();
  print(httpClient.fetchUsersList());
}