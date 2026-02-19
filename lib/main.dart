import 'package:flutter/material.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_config.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_delegate.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_info_parser.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_info_provider.dart';
import 'package:flutter_stepik/navigation/imperative_navigation/declarative_navigation.dart';
import 'package:flutter_stepik/navigation/imperative_navigation/navigator.dart';
import 'package:flutter_stepik/navigation/imperative_navigation/navigator_observer.dart/app_navigator_observer.dart';
import 'package:flutter_stepik/navigation/imperative_navigation/navigator_observer.dart/screens/main.dart';
import 'package:flutter_stepik/navigation/nested_navigation/declarative/root_decl_tab_screen.dart';
import 'package:flutter_stepik/navigation/nested_navigation/imparative/root_tab_screen.dart';
import 'package:flutter_stepik/navigation/outofcontextnavigation/app.dart';
import 'package:flutter_stepik/navigation/transfer_information/declarative/router/my_route_delegate.dart';
import 'package:flutter_stepik/navigation/transfer_information/declarative/screens/root_screen.dart';
import 'package:flutter_stepik/navigation/transfer_information/imperative/main_screen.dart';
import 'package:flutter_stepik/network/http/dart_io_test.dart';
import 'package:flutter_stepik/network/http/test_project/page_interceptor.dart';
import 'package:flutter_stepik/network/http/test_project/test_page.dart';
import 'package:flutter_stepik/network/websocket/test_project/chat_ui.dart';
import 'package:flutter_stepik/shared_preferences/flutter_secure_storage/flutter_secure_storage_test.dart';
import 'package:flutter_stepik/shared_preferences/share_preferences_lib/shared_prefs_test.dart';
import 'package:flutter_stepik/shared_preferences/share_preferences_lib/shared_prefs_custom/app_settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async{
     testGetFss();

    final preferences = await SharedPreferences.getInstance();
  runApp(MaterialApp(home: AppSettingsPage(preferences: preferences)));
}

final navigatorKey = GlobalKey<NavigatorState>();


final myRouterConfig = MyRouterConfig(routerDelegate: MyRouteDelegate(), routeInformationParser: MyRouteInformationParser(), routeInformationProvider: myRouteInfoProvider, backButtonDispatcher: RootBackButtonDispatcher(),);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen()
    );
    
  }
}