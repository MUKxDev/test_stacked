// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:test_stacked/ui/views/home/home_view.dart' as _i2;
import 'package:test_stacked/ui/views/startup/startup_view.dart' as _i1;
import 'package:test_stacked/ui/views/todos/todos_view.dart' as _i4;
import 'package:test_stacked/ui/views/todos_stream/todos_stream_view.dart'
    as _i5;
import 'package:test_stacked/ui/views/users/users_view.dart' as _i3;

class TestStackedRouter extends _i6.RootStackRouter {
  TestStackedRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.StartupView());
    },
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    UsersRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.UsersView());
    },
    TodosRoute.name: (routeData) {
      final args = routeData.argsAs<TodosRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.TodosView(key: args.key, userId: args.userId));
    },
    TodosStreamRoute.name: (routeData) {
      final args = routeData.argsAs<TodosStreamRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.TodosStreamView(key: args.key, userId: args.userId));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(StartupRoute.name, path: '/'),
        _i6.RouteConfig(HomeRoute.name, path: '/home-view'),
        _i6.RouteConfig(UsersRoute.name, path: '/users-view'),
        _i6.RouteConfig(TodosRoute.name, path: '/todos-view'),
        _i6.RouteConfig(TodosStreamRoute.name, path: '/todos-stream-view')
      ];
}

/// generated route for [_i1.StartupView]
class StartupRoute extends _i6.PageRouteInfo<void> {
  const StartupRoute() : super(name, path: '/');

  static const String name = 'StartupRoute';
}

/// generated route for [_i2.HomeView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-view');

  static const String name = 'HomeRoute';
}

/// generated route for [_i3.UsersView]
class UsersRoute extends _i6.PageRouteInfo<void> {
  const UsersRoute() : super(name, path: '/users-view');

  static const String name = 'UsersRoute';
}

/// generated route for [_i4.TodosView]
class TodosRoute extends _i6.PageRouteInfo<TodosRouteArgs> {
  TodosRoute({_i7.Key? key, required String userId})
      : super(name,
            path: '/todos-view',
            args: TodosRouteArgs(key: key, userId: userId));

  static const String name = 'TodosRoute';
}

class TodosRouteArgs {
  const TodosRouteArgs({this.key, required this.userId});

  final _i7.Key? key;

  final String userId;
}

/// generated route for [_i5.TodosStreamView]
class TodosStreamRoute extends _i6.PageRouteInfo<TodosStreamRouteArgs> {
  TodosStreamRoute({_i7.Key? key, required String userId})
      : super(name,
            path: '/todos-stream-view',
            args: TodosStreamRouteArgs(key: key, userId: userId));

  static const String name = 'TodosStreamRoute';
}

class TodosStreamRouteArgs {
  const TodosStreamRouteArgs({this.key, required this.userId});

  final _i7.Key? key;

  final String userId;
}
