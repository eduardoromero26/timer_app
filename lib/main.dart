import 'package:timer_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:timer_app/router/route_generator.dart';
import 'package:timer_app/ui/layout/main_layout_page.dart';

import 'package:timer_app/services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timer App',
      initialRoute: '/timer',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: (_, child) {
        return MainLayoutPage(
          child: child ?? Container(),
        );
      },
    );
  }
}
