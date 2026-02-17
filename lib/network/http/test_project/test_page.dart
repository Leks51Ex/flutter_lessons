import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_stepik/network/http/test_project/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   User? _userData;
   String? _helloStr;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _fetchUsersList, child: Text('Получить данные юзера 1')),
            SizedBox(height: 10,),
            Text(_userData !=null ? '${_userData!.name} ${_userData!.surname}': 'Данные нет'),
               SizedBox(height: 10,),
            ElevatedButton(onPressed: _createUser, child: Text('Добавить юзера')),
                SizedBox(height: 10,),
            ElevatedButton(onPressed: _updateUser, child: Text('Обновить юзера 1')),
                 SizedBox(height: 10,),
            ElevatedButton(onPressed: _patchUser, child: Text('Обновить имя юзера 1')),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              _deleteUser(context);
            }, child: Text('Удалить юзера 1')),
              SizedBox(height: 10,),
            ElevatedButton(onPressed: 
              _sayHello
            , child: Text('Поздароваться')),
            SizedBox(height: 10,),
            Text(_helloStr != null ? _helloStr! : '...')
          ],
        ),
      ),
    );
  }
   

   void _fetchUsersList() async {
    final url = Uri.parse('http://localhost:8080/users/5');
    final response = await http.get(url);
    if (response.statusCode ==200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(data);
      setState(() => _userData= user);
      return;
    }
   }

  void _createUser() async {
    final url = Uri.parse('http://localhost:8080/users');
    final user = User(
      id: 6,
      name: 'Игорь',
      surname: 'Валерьевич',
      lastname: 'Ватюнин',
      email: 'vatunin@example.com',
      age: 25,
      height: 180,
      weight: 70,
    );
    final data = jsonEncode(user.toJson());
    final response = await http.post(url, body: data);
    print(response.statusCode);
  }
  


  
  void _updateUser() async {
    final url = Uri.parse('http://localhost:8080/users/1');
    final user = User(
      id: 1,
      name: 'Игорь',
      surname: 'Валерьевич',
      lastname: 'Ватюнин',
      email: 'vatunin@example.com',
      age: 25,
      height: 180,
      weight: 70,
    );
    final data = jsonEncode(user.toJson());
    final response = await http.put(url, body: data);
    print(response.statusCode);
  }
   

    void _patchUser() async {
    final url = Uri.parse('http://localhost:8080/users/1');
    final updates = {'name': 'Игорь'};
    final data = jsonEncode(updates);
    final response = await http.patch(url, body: data);
    print(response.statusCode);
  } 

    void _deleteUser(BuildContext context) async {
     final scaffoldMessenger  = ScaffoldMessenger.of(context);
    final url = Uri.parse('http://localhost:8080/users/5');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      
         scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Пользователь удален')),
        
      );
      return;
    }
    if (response.statusCode == 404) {
        scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Пользователь не найден')),
      );
      return;
    }
     scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Что-то пошло не так')),
      
    );
     print(response.statusCode);
   
  }

  void _sayHello() async {
    final url = Uri.parse('http://localhost:8080/hello');
    final response = await http.get(
      url,
      headers: {HttpHeaders.acceptLanguageHeader: 'ru'},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as String;
      setState(() => _helloStr = data);
      return;
    }
  }




}