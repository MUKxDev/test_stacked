import 'dart:developer' as dev;
import 'dart:math';

import 'package:stacked/stacked.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/router/router.gr.dart';
import 'package:test_stacked/app/services/router_service.dart';
import 'package:test_stacked/app/services/users_service.dart';
import 'package:test_stacked/models/User.dart';

// This model uses FutureViewModel so you can have one future to bring the data
class UsersViewModel extends FutureViewModel<List<User>> {
  // will be called when the model is ready
  Future<void> init() async {
    dev.log('init called', name: 'UsersViewModel');
  }

  /**========================================================================
   *                               SERVICES
   *========================================================================**/

  final UsersService _usersService = locator<UsersService>();
  final RouterService _routerService = locator<RouterService>();

  /**========================================================================
   *                               FUNCTIONS
   *========================================================================**/

  // create a random user and push it to backend
  createUser() async {
    int _random = Random().nextInt(100);
    // create the user
    User user = User(
      name: 'Mohamed $_random',
      image:
          'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png',
    );
    // push the user to the backend
    await _usersService.createUser(user);

    //? I think this is a work-around to refresh the state (re-call the future)
    //? It's okay because we only call one future to update
    initialise();
  }

  // navigate to the Todos view with the userId
  onUserClick(String userId) {
    dev.log(userId, name: 'the clicked user id');
    navigateToTodos(userId);
  }

  // delete the long pressed user on hold
  onUserLongPress(String userId) async {
    dev.log(userId, name: 'Long pressed user id');
    await _usersService.deleteUser(userId);

    //? refresh the state (re-call the future)
    initialise();
  }

  /**========================================================================
   *                               NAVIGATIONS
   *========================================================================**/

  // navigate to Todos view
  navigateToTodos(String userId) async {
    // navigate to Todos view and pass the user id
    await _routerService.router.navigate(TodosRoute(userId: userId));
  }

  // navigate to Todos Stream view
  navigateToTodosStream(String userId) async {
    // navigate to Todos view and pass the user id
    await _routerService.router.navigate(TodosStreamRoute(userId: userId));
  }

  /**========================================================================
   **                                FUTURE
   *========================================================================**/

  // put the wanted future here
  @override
  Future<List<User>> futureToRun() {
    dev.log('futureToRun called', name: 'UsersViewModel');
    return _usersService.getUsers();
  }
}
