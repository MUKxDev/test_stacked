import 'package:flutter/material.dart';
import 'package:test_stacked/app/core/custom_base_view_model.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/router/router.dart';
import 'package:test_stacked/app/services/router_service.dart';

class StartupViewModel extends CustomBaseViewModel {
  final RouterService _routerService = locator<RouterService>();

  Future<void> init() async {
    WidgetsBinding.instance!.addPostFrameCallback((Duration duration) async {
      await navigateToHomeView();
    });
  }

  Future navigateToHomeView() async {
    await _routerService.router.pushAndPopUntil(
      HomeRoute(),
      predicate: (Route<dynamic> route) => false,
    );
  }
}
