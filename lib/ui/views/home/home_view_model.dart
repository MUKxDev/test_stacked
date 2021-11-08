import 'package:test_stacked/app/core/custom_base_view_model.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/router/router.dart';
import 'package:test_stacked/app/services/router_service.dart';

class HomeViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  final RouterService _routerService = locator<RouterService>();
  navigateToUsers() async {
    await _routerService.router.navigate(UsersRoute());
  }
}
