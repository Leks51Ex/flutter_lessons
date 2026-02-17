import 'package:flutter/material.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/screens/error.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/screens/home.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/screens/profile.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/screens/root.dart';


import '../../imperative_navigation/declarative_navigation.dart';

class MyRouteDelegate extends RouterDelegate<String> with ChangeNotifier, PopNavigatorRouterDelegateMixin{
List<Page> pages = [];

String _currentPath = '/';

@override
  String? get currentConfiguration => _currentPath;


  @override
  Widget build(BuildContext context) {
return Navigator(
  key: navigatorKey,
  pages: [MaterialPage(child: RootScreen()), ...pages],
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
  Future<void> setNewRoutePath(String configuration)async {
       Page? newPage = switch(configuration){
         '/home' => const MaterialPage(child: HomeDeclScreen()),
      '/profile' => const MaterialPage(child: ProfileDeclScreen()),
      '/error' => const MaterialPage(child: ErrorDeclScreen()),
      _ => null,
       };
       _currentPath = configuration;
       if (configuration == '/') {
         pages.clear();
       }
       if (newPage !=null) {
         pages.add(newPage);
       }
       notifyListeners();
  }

  // @override
  // Future<bool> popRoute() {
  //   return Future.value(true);
  // }
  
  @override
  GlobalKey<NavigatorState>? get navigatorKey =>  GlobalKey<NavigatorState>();
  

}