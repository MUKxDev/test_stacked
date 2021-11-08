import 'dart:developer' as dev;
import 'dart:math';

import 'package:stacked/stacked.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/router/router.gr.dart';
import 'package:test_stacked/app/services/router_service.dart';
import 'package:test_stacked/app/services/users_service.dart';
import 'package:test_stacked/models/User.dart';
import 'package:test_stacked/ui/views/todos/todos_view.dart';

class UsersViewModel extends FutureViewModel<List<User>> {
  Future<void> init() async {
    dev.log('init called', name: 'UsersViewModel');
  }

  final UsersService _usersService = locator<UsersService>();
  final RouterService _routerService = locator<RouterService>();

  @override
  Future<List<User>> futureToRun() {
    dev.log('futureToRun called', name: 'UsersViewModel');
    return _usersService.getUsers();
  }

  creatUser() async {
    int _random = Random().nextInt(100);
    User user = User(
      name: 'Mohamed $_random',
      image:
          'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png',
    );
    await _usersService.createUser(user);
    futureToRun();
    notifyListeners();
  }

  onUserClick(String userId) {
    dev.log(userId, name: 'the clicked user id');
    navigateToTodos(userId);
  }

  onUserLongPress(String userId) async {
    dev.log(userId, name: 'the long clicked user id');
    await _usersService.deleteUser(userId);
    notifyListeners();
  }

  navigateToTodos(String userId) async {
    await _routerService.router.navigate(TodosRoute(userId: userId));
  }
  // navigateToTodos(String userId) async {
  //   await _routerService.router.pushWidget(TodosView(userId: userId));
  // }
}
