import 'dart:developer';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:injectable/injectable.dart';
import 'package:test_stacked/models/Todo.dart';

@lazySingleton
class TodosService {
  final amplify = Amplify;

  // create a todo
  Future<bool> createTodo(Todo todo) async {
    return amplify.DataStore.save(todo)
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  // get all the todos as a future
  Future<List<Todo>> getTodos() async {
    List<Todo> todos = [];
    try {
      todos = await amplify.DataStore.query(Todo.classType);
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    return todos;
  }

  // trying to modify the data before returning the future value
  Future<List<Todo>> getTodosPipe() async {
    List<Todo> todos = [];
    try {
      todos = await amplify.DataStore.query(Todo.classType).then((value) async {
        List<Todo> _tempList = value;
        for (int i = 0; i < _tempList.length; i++) {
          var element = _tempList[i];
          _tempList[i] = element.copyWith(name: element.name + ' Ducki');
        }
        return _tempList;
      });
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    return todos;
  }

  // get all the todos as a stream
  Stream<QuerySnapshot<Todo>> getTodosStream() async* {
    Stream<QuerySnapshot<Todo>> todos = const Stream.empty();
    try {
      todos = amplify.DataStore.observeQuery(Todo.classType);
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    yield* todos;
  }

  //? does stream pipe stuff work?
  // Stream<QuerySnapshot<Todo>> getTodosStreamPipe() async* {
  //   Stream<QuerySnapshot<Todo>> todos = const Stream.empty();
  //   try {
  //     todos = amplify.DataStore.observeQuery(Todo.classType).pipe(streamConsumer);
  //   } catch (e) {
  //     log("Could not query DataStore: " + e.toString());
  //   }
  //   yield* todos;
  // }

  // get a single todo as a future
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

  // get all the todos of a user as a future
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

  // delete a single todo
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
