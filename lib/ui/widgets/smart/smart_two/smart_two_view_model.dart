import 'package:stacked/stacked.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/services/increment_service.dart';

class SmartTwoViewModel extends ReactiveViewModel {
  Future<void> init() async {}
  // declare the service
  final IncrementService _incrementService = locator<IncrementService>();

  // get the value from the service
  int get theCurrentValue => _incrementService.theUltimateValue;

  // call the increment method in the service with the passed value
  increment() {
    _incrementService.increment(5);
  }

  // put all the services that you want this viewModle to be reactive for
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_incrementService];
}
