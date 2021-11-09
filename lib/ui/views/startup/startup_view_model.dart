import 'package:flutter/material.dart';
import 'package:test_stacked/app/core/custom_base_view_model.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/router/router.dart';
import 'package:test_stacked/app/services/router_service.dart';

class StartupViewModel extends CustomBaseViewModel {
  // will be called when the model is ready
  Future<void> init() async {
    WidgetsBinding.instance!.addPostFrameCallback((Duration duration) async {
      await navigateToHomeView();
    });
  }

  /**========================================================================
   *                               SERVICES
   *========================================================================**/
  final RouterService _routerService = locator<RouterService>();

  /**========================================================================
   *                               NAVIGATIONS
   *========================================================================**/
  // Navigate to the home view and pop the previous route (can't go back)
  Future navigateToHomeView() async {
    await _routerService.router.pushAndPopUntil(
      const HomeRoute(),
      predicate: (Route<dynamic> route) => false,
    );
  }
}
