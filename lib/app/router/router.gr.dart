// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:test_stacked/ui/views/home/home_view.dart' as _i2;
import 'package:test_stacked/ui/views/startup/startup_view.dart' as _i1;
import 'package:test_stacked/ui/views/todos/todos_view.dart' as _i4;
import 'package:test_stacked/ui/views/users/users_view.dart' as _i3;

class TestStackedRouter extends _i5.RootStackRouter {
  TestStackedRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.StartupView());
    },
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    UsersRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.UsersView());
    },
    TodosRoute.name: (routeData) {
      final args = routeData.argsAs<TodosRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.TodosView(key: args.key, userId: args.userId));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(StartupRoute.name, path: '/'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-view'),
        _i5.RouteConfig(UsersRoute.name, path: '/users-view'),
        _i5.RouteConfig(TodosRoute.name, path: '/todos-view')
      ];
}

/// generated route for [_i1.StartupView]
class StartupRoute extends _i5.PageRouteInfo<void> {
  const StartupRoute() : super(name, path: '/');

  static const String name = 'StartupRoute';
}

/// generated route for [_i2.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-view');

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.UsersView]
class UsersRoute extends _i5.PageRouteInfo<void> {
  const UsersRoute() : super(name, path: '/users-view');

  static const String name = 'UsersRoute';
}

/// generated route for [_i4.TodosView]
class TodosRoute extends _i5.PageRouteInfo<TodosRouteArgs> {
  TodosRoute({_i6.Key? key, required String userId})
      : super(name,
            path: '/todos-view',
            args: TodosRouteArgs(key: key, userId: userId));

  static const String name = 'TodosRoute';
}

class TodosRouteArgs {
  const TodosRouteArgs({this.key, required this.userId});

  final _i6.Key? key;

  final String userId;
}
