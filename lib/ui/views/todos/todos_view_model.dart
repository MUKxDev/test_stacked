import 'dart:math';

import 'dart:developer' as dev;

import 'package:stacked/stacked.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/services/todos_service.dart';
import 'package:test_stacked/models/Todo.dart';

const String _allTodosFuture = 'allTodos';
const String _userTodosFuture = 'userTodos';

// This model uses MultipleFutureViewModel so you can have more than one future to bring the data
class TodosViewModel extends MultipleFutureViewModel {
  // constructor
  TodosViewModel(this.userId);

  // will be called when the model is ready
  Future<void> init() async {}

  /**========================================================================
   *                               SERVICES
   *========================================================================**/
  final TodosService _todosService = locator<TodosService>();

  /**========================================================================
   *                                 VARS
   *========================================================================**/
  final String userId;

  /**========================================================================
   *                               GETTERS
   *========================================================================**/
  // getters of the retrieved data
  List<Todo> get fetchedTodos => dataMap?[_allTodosFuture];
  List<Todo> get fetchedUserTodos => dataMap?[_userTodosFuture];

  /**========================================================================
   *                               STATE
   *========================================================================**/
  // busy states for the futures
  bool get fetchingTodos => busy(_allTodosFuture);
  bool get fetchingUserTodos => busy(_userTodosFuture);

  /**========================================================================
   *                               FUNCTIONS
   *========================================================================**/
  // create a random todo and push it to backend
  createTodo() async {
    int _random = Random().nextInt(100);
    Todo todo = Todo(
      name: 'Todo $_random',
      description: 'Todo description $_random $_random $_random',
      userID: userId,
    );

    // push to backend
    await _todosService.createTodo(todo);

    //? This will update the state, it works BUT
    //? it will re-call all the futures (if that is what you want it's good)
    initialise();

    //? if you want to update the state to a specific future make a function like the bellow function
    // await refreshUserTodos();
  }

  // this will refresh the state of only the user todos by re-calling the future
  Future<void> refreshUserTodos() async {
    dataMap?[_userTodosFuture] =
        await runBusyFuture<List<Todo>>(_todosService.getUserTodos(userId));
    notifyListeners();
  }

  // log the id of the pressed todo
  onTodoClick(String todoId) {
    dev.log(todoId, name: 'the clicked todo id');
  }

  // delete the long pressed todo
  onTodoLongPress(String todoId) async {
    dev.log(todoId, name: 'the long clicked todo id');
    await _todosService.deleteTodo(todoId);

    //? This will update the state, it works BUT
    //? it will re-call all the futures (if that is what you want it's good)
    initialise();
  }

  /**========================================================================
   **                               FUTURES
   *========================================================================**/
  // put all the futures you want to call on initialise here
  @override
  Map<String, Future<List<Todo>> Function()> get futuresMap => {
        //? test a future with a pipe
        // _allTodosFuture: () => _todosService.getTodosPipe(),
        _allTodosFuture: () => _todosService.getTodos(),
        _userTodosFuture: () => _todosService.getUserTodos(userId),
      };
}
