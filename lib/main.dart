import 'package:flutter/material.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_config.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_delegate.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_info_parser.dart';
import 'package:flutter_stepik/navigation/declarative_navigation/example/route_info_provider.dart';
import 'package:flutter_stepik/network/websocket/test_project/chat_ui.dart';
import 'package:flutter_stepik/shared_preferences/drift/database/database.dart';
import 'package:flutter_stepik/shared_preferences/drift/drift_test.dart';
import 'package:flutter_stepik/shared_preferences/share_preferences_lib/shared_prefs_custom/app_settings_page.dart';
import 'package:flutter_stepik/tests/calculator_app/calculator_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  final preferences = await SharedPreferences.getInstance();
  runApp(MaterialApp(home: CalculatorScreen()));
}

final navigatorKey = GlobalKey<NavigatorState>();

final myRouterConfig = MyRouterConfig(
  routerDelegate: MyRouteDelegate(),
  routeInformationParser: MyRouteInformationParser(),
  routeInformationProvider: myRouteInfoProvider,
  backButtonDispatcher: RootBackButtonDispatcher(),
);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ChatScreen());
  }
}
