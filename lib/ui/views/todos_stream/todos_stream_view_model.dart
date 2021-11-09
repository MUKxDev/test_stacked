import 'dart:math';
import 'dart:developer' as dev;

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:stacked/stacked.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/services/todos_service.dart';
import 'package:test_stacked/models/Todo.dart';

// This viewModle uses the StreamViewModel so you don't need to refresh the state! yay (;
class TodosStreamViewModel extends StreamViewModel {
  // constructor
  TodosStreamViewModel(this.userId);

  // will be called when the model is ready
  Future<void> init() async {}

  /**========================================================================
   *                               SERVICES
   *========================================================================**/

  final TodosService _todosService = locator<TodosService>();

  /**========================================================================
   *                                 VARS
   *========================================================================**/
  // var
  final String userId;

  /**========================================================================
   *                               FUNCTIONS
   *========================================================================**/
  // create a random todo and push it to backend
  createTodo() async {
    int _random = Random().nextInt(100);

    // craete a random todo
    Todo todo = Todo(
      name: 'Todo $_random',
      description: 'Todo description $_random $_random $_random',
      userID: userId,
    );

    // push the todo to the backend
    await _todosService.createTodo(todo);
  }

  // log the id of the clicked todo
  onTodoClick(String todoId) {
    dev.log(todoId, name: 'the clicked todo id');
  }

  // delete the long pressed todo
  onTodoLongPress(String todoId) async {
    dev.log(todoId, name: 'the long clicked todo id');
    await _todosService.deleteTodo(todoId);
  }

  /**========================================================================
   **                               STREAM
   *========================================================================**/
  // put the wanted stream here
  @override
  Stream<QuerySnapshot<Todo>> get stream => _todosService.getTodosStream();
}
