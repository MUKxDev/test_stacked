import 'package:auto_route/auto_route.dart';
import 'package:test_stacked/ui/views/home/home_view.dart';
import 'package:test_stacked/ui/views/startup/startup_view.dart';
import 'package:test_stacked/ui/views/todos/todos_view.dart';
import 'package:test_stacked/ui/views/todos_stream/todos_stream_view.dart';
import 'package:test_stacked/ui/views/users/users_view.dart';

export './router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    /**========================================================================
    *                 How to put a routes in the router
    *  put all your routes here with the view as the page 
    *  and then run the "generate" command to to put it in the router
    *  
    *  you can find the "generate" command in the ReadMe file
    *========================================================================**/
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: HomeView),
    AdaptiveRoute(page: UsersView),
    AdaptiveRoute(page: TodosView),
    AdaptiveRoute(page: TodosStreamView),
  ],
)
class $TestStackedRouter {}
