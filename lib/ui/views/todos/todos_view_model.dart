import 'dart:math';

import 'dart:developer' as dev;

import 'package:stacked/stacked.dart';
import 'package:test_stacked/app/locator/locator.dart';
import 'package:test_stacked/app/services/todos_service.dart';
import 'package:test_stacked/models/Todo.dart';

const String _allTodosFuture = 'allTodos';
const String _userTodosFuture = 'userTodos';

class TodosViewModel extends MultipleFutureViewModel {
  TodosViewModel(this.userId);

  Future<void> init() async {}

  final String userId;
  final TodosService _todosService = locator<TodosService>();

  List<Todo> get fetchedTodos => dataMap?[_allTodosFuture];
  List<Todo> get fetchedUserTodos => dataMap?[_userTodosFuture];

  Future<List<Todo>> get allTodos => _todosService.getTodos();

  bool get fetchingTodos => busy(_allTodosFuture);
  bool get fetchingUserTodos => busy(_userTodosFuture);

  creatTodo() async {
    int _random = Random().nextInt(100);
    Todo todo = Todo(
      name: 'Todo $_random',
      description: 'Todo description $_random $_random $_random',
      userID: userId,
    );
    await _todosService.createTodo(todo);
    notifyListeners();
  }

  onTodoClick(String todoId) {
    dev.log(todoId, name: 'the clicked todo id');
  }

  onTodoLongPress(String todoId) async {
    dev.log(todoId, name: 'the long clicked todo id');
    await _todosService.deleteTodo(todoId);
    notifyListeners();
  }

  @override
  Map<String, Future<List<Todo>> Function()> get futuresMap => {
        _allTodosFuture: () => _todosService.getTodos(),
        _userTodosFuture: () => _todosService.getUserTodos(userId),
      };
}
