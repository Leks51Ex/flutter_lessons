import 'dart:convert';
import 'dart:io';

class TestDartIo {






Future<void> fetchUsersList() async {
  final uri = Uri.parse('http://jsonplaceholder.typicode.com/users/6');

final response = await HttpClient().getUrl(uri).then((request)=> request.close());


if (response.statusCode == HttpStatus.ok) {
  final responsBody = await response.transform(utf8.decoder).join();
  final data = jsonDecode(responsBody);
  final name = data['name'];
  print('hello my name is $name');
}else {
  print('Failed to load data');
}

}

}



void main(List<String> args) {
  final TestDartIo httpClient = TestDartIo();
  print(httpClient.fetchUsersList());
}