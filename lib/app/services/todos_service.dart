import 'dart:developer';

import 'package:amplify_flutter/amplify.dart';
import 'package:injectable/injectable.dart';
import 'package:test_stacked/models/Todo.dart';

@lazySingleton
class TodosService {
  final amplify = Amplify;

  Future<bool> createTodo(Todo todo) async {
    return amplify.DataStore.save(todo)
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Future<List<Todo>> getTodos() async {
    List<Todo> todos = [];
    try {
      todos = await amplify.DataStore.query(Todo.classType);
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    return todos;
  }

  Future<Todo?> getTodo(String todoId) async {
    return await amplify.DataStore.query(Todo.classType,
            where: Todo.ID.eq(todoId))
        .then((tempTodos) {
      if (tempTodos.isNotEmpty) {
        return tempTodos[0];
      }
      return null;
    });
  }

  Future<List<Todo>> getUserTodos(String userId) async {
    List<Todo> todos = [];
    try {
      todos = await amplify.DataStore.query(Todo.classType,
          where: Todo.USERID.eq(userId));
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    return todos;
  }

  Future<bool> deleteTodo(String todoId) async {
    return await amplify.DataStore.query(Todo.classType,
            where: Todo.ID.eq(todoId))
        .then((tempTodos) async {
      if (tempTodos.isNotEmpty) {
        await amplify.DataStore.delete(tempTodos[0]);
        return true;
      }
      return false;
    });
  }
}
