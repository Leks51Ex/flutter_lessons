import 'package:flutter/material.dart';

import 'package:flutter_stepik/navigation/declarative_navigation/screens/root.dart';
import 'package:flutter_stepik/navigation/transfer_information/declarative/screens/home_screen.dart';
import 'package:flutter_stepik/navigation/transfer_information/declarative/screens/profile_screen.dart';
import 'package:flutter_stepik/navigation/transfer_information/declarative/screens/root_screen.dart';



class MyRouteDataDelegate extends RouterDelegate<String> with ChangeNotifier, PopNavigatorRouterDelegateMixin{
List<Page> pages = [];

String _currentPath = '/';

@override
  String? get currentConfiguration => _currentPath;


  @override
  Widget build(BuildContext context) {
return Navigator(
  key: navigatorKey,
  pages: [MaterialPage(child: RootDataScreen()), ...pages],
  onDidRemovePage: (page){
    pages.remove(page);
    if (pages.isEmpty) {
      setNewRoutePath('/');
    }
    notifyListeners();
  },
);
  }  


  @override
  Future<void> setNewRoutePath(String configuration) async {
    // Обновляем состояние
    _currentPath = configuration;
    if (configuration == '/') {
      // Если текущая страница - корневая, то очищаем список
      pages.clear();
    }

    // Обновляем состояние
    notifyListeners();
  }


 Future<void> navigateTo(String url, {String? args}) async {
    Page? newPage;
    // Получаем путь до первого символа ":"
    final path = url.split('/:').first;

    if (path == '/home') {
      newPage = MaterialPage(child: HomeDataScreen(date: args));
    } else if (path == '/profile') {
       // Получаем путь до первого символа ":" и получаем id
      final id = url.split('/:').last;
       // Передаем id в ProfileScreen
      newPage = MaterialPage(child: ProfileDataScreen(id: id));
    }

    if (newPage != null) {
      // конфигурируем новую страницу
      // добавляем новую страницу в список
      pages.add(newPage);
    }

    setNewRoutePath(path);
  }


  @override
  GlobalKey<NavigatorState>? get navigatorKey =>  GlobalKey<NavigatorState>();
  

}