import 'package:flutter/material.dart';
import 'package:flutter_stepik/animations/animated_widgets/animated_container.dart';
import 'package:flutter_stepik/animations/animated_widgets/animated_rotation.dart';
import 'package:flutter_stepik/animations/animated_widgets/animated_scale.dart';
import 'package:flutter_stepik/animations/animated_widgets/animated_size.dart';
import 'package:flutter_stepik/animations/animated_widgets/animated_slide.dart';
import 'package:flutter_stepik/animations/custom_animations/custom_animated_container.dart';
import 'package:flutter_stepik/animations/hero.dart';
import 'package:flutter_stepik/animations/staggerd_animations/staggered_animations.dart';
import 'package:flutter_stepik/localization/localization_test_app/local_app.dart';
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
  runApp(MyApp());
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
    return MaterialApp(home: CustomStaggeredAnimatedContainer());
  }
}
