import 'package:flutter_secure_storage/flutter_secure_storage.dart';

  final String email = 'test@mail.ru';
  final int age = 30;
  final bool isLogged = true;
  final double balance = 20.35;
  final DateTime data = DateTime.now();
  const secureStorage = FlutterSecureStorage();


Future<void> testLoadFSS()async{
await secureStorage.write(key: 'email', value: email);
await secureStorage.write(key: 'age', value: age.toString());
await secureStorage.write(key: 'is_logged', value: isLogged.toString()); 
await secureStorage.write(key: 'balance', value: balance.toString());
await secureStorage.write(
    key: 'data',
    value: data.toIso8601String(), 
  );


  print('Персональные данные сохранены.');
}





Future<void>testGetFss()async{
 final savedEmail = await secureStorage.read(key: 'email')?? 'wtf_email';
 final savedAge = int.tryParse(await secureStorage.read(key: 'age')?? '0');
 final savedIsLogged = (await secureStorage.read(key: 'is_logged')) == 'true';
  final savedBalance = double.tryParse(
                           await secureStorage.read(key: 'balance') ?? '0.0');
  
  final data = await secureStorage.read(key: 'data');
  final savedData = data != null 
                                     ? DateTime.parse(data) 
                                     : null;

      print('Имя пользователя: $savedEmail');
  print('Возраст пользователя: $savedAge');
  print('Авторизован: $savedIsLogged');
  print('Баланс пользователя: $savedBalance');
  print('Последний вход: $savedData');                                 


}