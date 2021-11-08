import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class IncrementService with ReactiveServiceMixin {
  // declare a reactive value
  final _theUltimateValue = ReactiveValue<int>(0);

  // put all the reactive values into the constructor
  IncrementService() {
    listenToReactiveValues([_theUltimateValue]);
  }

  // get method to retrieve the current value
  int get theUltimateValue => _theUltimateValue.value;

  // increment the ReactiveValue with the passed value
  void increment(int value) {
    _theUltimateValue.value = _theUltimateValue.value + value;

    // notify all listeners of the current value
    notifyListeners();
  }
}
