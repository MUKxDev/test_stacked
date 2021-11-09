import 'package:test_stacked/app/core/custom_base_view_model.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/router/router.dart';
import 'package:test_stacked/app/services/router_service.dart';

class HomeViewModel extends CustomBaseViewModel {
  // will be called when the model is ready
  Future<void> init() async {}

  // declaring services
  final RouterService _routerService = locator<RouterService>();

  // navigate to the users view
  navigateToUsers() async {
    await _routerService.router.navigate(const UsersRoute());
  }
}
