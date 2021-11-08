import "package:injectable/injectable.dart";
import "package:test_stacked/app/router/router.dart";
    
@lazySingleton
class RouterService {
  final TestStackedRouter router = TestStackedRouter();
}