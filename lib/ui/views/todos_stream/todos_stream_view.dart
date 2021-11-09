import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_stacked/models/Todo.dart';

import './todos_stream_view_model.dart';

class TodosStreamView extends StatelessWidget {
  const TodosStreamView({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodosStreamViewModel>.reactive(
      viewModelBuilder: () => TodosStreamViewModel(userId),
      onModelReady: (TodosStreamViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TodosStreamViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Stream Todos'),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => model.createTodo(),
                        child: const Text('Create Todo'),
                      ),
                    ],
                  ),
                ),
                _instructionsWidget(),
                const Text('All todos'),
                _allTodos(model),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _instructionsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          Text('click on todo to print todoId'),
          Divider(),
          Text('hold a todo to delete the todo'),
        ],
      ),
    );
  }

  Widget _allTodos(TodosStreamViewModel model) {
    return model.isBusy
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : StreamBuilder<QuerySnapshot<Todo>>(
            stream: model.stream,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Todo>> snapshot) {
              return model.hasError
                  ? _errorWidget()
                  : !snapshot.hasData
                      ? _noDataWidget()
                      : (snapshot.data!.items.isEmpty
                          ? _emptyTodosWidget()
                          : _todosWidget(snapshot, model));
            },
          );
  }

  Expanded _todosWidget(
    AsyncSnapshot<QuerySnapshot<Todo>> snapshot,
    TodosStreamViewModel model,
  ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
            itemCount: snapshot.data?.items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => model.onTodoClick(snapshot.data!.items[index].id),
                onLongPress: () =>
                    model.onTodoLongPress(snapshot.data!.items[index].id),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(snapshot.data!.items[index].id),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(snapshot.data!.items[index].name),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(snapshot.data!.items[index].description ??
                          'no description'),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(snapshot.data!.items[index].userID ?? 'no user'),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Expanded _emptyTodosWidget() {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('There are no todos'),
          )),
    );
  }

  Expanded _noDataWidget() {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('There are no data'),
          )),
    );
  }

  Expanded _errorWidget() {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text('An error occurred'),
          )),
    );
  }
}
