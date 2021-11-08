import 'package:auto_route/auto_route.dart';
import 'package:test_stacked/ui/views/home/home_view.dart';
import 'package:test_stacked/ui/views/startup/startup_view.dart';
import 'package:test_stacked/ui/views/todos/todos_view.dart';
import 'package:test_stacked/ui/views/users/users_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: UsersView),
    AdaptiveRoute(page: TodosView),
  ],
)
class $TestStackedRouter {}
