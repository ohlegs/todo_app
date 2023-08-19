import 'package:flutter/material.dart';
import 'package:project/core/presentation/pages/Home.dart';

class Routes {
  static const String home = '/';
  static const String details = '/details';

  static Map<String, WidgetBuilder> getRoute() {
    return {
      home: (context) => const Home(),
    };
  }
}