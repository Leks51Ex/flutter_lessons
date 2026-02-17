import 'package:flutter/material.dart';

class MyRouteInformationParser  extends RouteInformationParser<String>{
@override
  Future<String> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = routeInformation.uri;

    if (uri.path == '/') {
      return '/';
    } else if (uri.path == '/home') {
      return '/home';
    } else if (uri.path == '/profile') {
      return '/profile';
    }
    return '/error';
  }


  @override
  RouteInformation? restoreRouteInformation(String configuration) {

    return RouteInformation(uri: Uri.parse(configuration));
  }
}