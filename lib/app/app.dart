import 'package:flutter/material.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/services/router_service.dart';

class TestStackedApp extends StatelessWidget {
  const TestStackedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();

    return MaterialApp.router(
      title: "TestStacked",
      routeInformationParser: _routerService.router.defaultRouteParser(),
      routerDelegate: _routerService.router.delegate(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
