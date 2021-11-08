import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_stacked/models/Todo.dart';

import './todos_view_model.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodosViewModel>.reactive(
      viewModelBuilder: () => TodosViewModel(userId),
      onModelReady: (TodosViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TodosViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => model.creatTodo(),
                        child: const Text('Creat Todo'),
                      ),
                    ],
                  ),
                ),
                model.fetchingUserTodos
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Builder(
                        builder: (BuildContext context) {
                          List<Todo> todos = model.fetchedUserTodos;
                          return todos.isEmpty
                              ? Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.all(16.0),
                                      padding: const EdgeInsets.all(16.0),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[200],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                        child: Text(
                                            'There are no todos by this user'),
                                      )),
                                )
                              : Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(16.0),
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[200],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListView.builder(
                                        itemCount: todos.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () => model
                                                .onTodoClick(todos[index].id),
                                            onLongPress: () =>
                                                model.onTodoLongPress(
                                                    todos[index].id),
                                            child: Container(
                                              margin: const EdgeInsets.all(8.0),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey[100],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(todos[index].id),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(todos[index].name),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(todos[index]
                                                          .description ??
                                                      'no description'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(todos[index].userID ??
                                                      'no user'),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                );
                        },
                      ),

                // FutureBuilder(
                //     future: model.allTodos,
                //     builder: (BuildContext context,
                //         AsyncSnapshot<List<Todo>> snapshot) {
                //       List<Todo> todos = [];
                //       if (snapshot.hasData) {
                //         if (snapshot.data!.isNotEmpty) {
                //           todos = snapshot.data!;
                //         }
                //       }
                //       return snapshot.hasData
                //           ? Expanded(
                //               child: Container(
                //                   margin: const EdgeInsets.all(16.0),
                //                   padding: const EdgeInsets.all(16.0),
                //                   width: double.infinity,
                //                   decoration: BoxDecoration(
                //                     color: Colors.blueGrey[200],
                //                     borderRadius: BorderRadius.circular(20),
                //                   ),
                //                   child: const Center(
                //                     child: Text('There are no todos'),
                //                   )),
                //             )
                //           : Expanded(
                //               child: Container(
                //                 margin: const EdgeInsets.all(16.0),
                //                 padding: const EdgeInsets.all(16.0),
                //                 decoration: BoxDecoration(
                //                   color: Colors.blueGrey[200],
                //                   borderRadius: BorderRadius.circular(20),
                //                 ),
                //                 child: ListView.builder(
                //                     itemCount: todos.length,
                //                     itemBuilder:
                //                         (BuildContext context, int index) {
                //                       return GestureDetector(
                //                         onTap: () =>
                //                             model.onTodoClick(todos[index].id),
                //                         onLongPress: () => model
                //                             .onTodoLongPress(todos[index].id),
                //                         child: Container(
                //                           margin: const EdgeInsets.all(8.0),
                //                           padding: const EdgeInsets.all(8.0),
                //                           decoration: BoxDecoration(
                //                             color: Colors.blueGrey[100],
                //                             borderRadius:
                //                                 BorderRadius.circular(20),
                //                           ),
                //                           child: Column(
                //                             children: [
                //                               Text(todos[index].id),
                //                               const SizedBox(
                //                                 height: 8,
                //                               ),
                //                               Text(todos[index].name),
                //                               const SizedBox(
                //                                 height: 8,
                //                               ),
                //                               Text(todos[index].description ??
                //                                   'no description'),
                //                               const SizedBox(
                //                                 height: 8,
                //                               ),
                //                               Text(todos[index].userID ??
                //                                   'no user'),
                //                             ],
                //                           ),
                //                         ),
                //                       );
                //                     }),
                //               ),
                //             );
                //     })
                model.fetchingTodos
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Builder(
                        builder: (BuildContext context) {
                          List<Todo> todos = model.fetchedTodos;
                          return todos.isEmpty
                              ? Expanded(
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
                                )
                              : Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.all(16.0),
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[200],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListView.builder(
                                        itemCount: todos.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () => model
                                                .onTodoClick(todos[index].id),
                                            onLongPress: () =>
                                                model.onTodoLongPress(
                                                    todos[index].id),
                                            child: Container(
                                              margin: const EdgeInsets.all(8.0),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey[100],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(todos[index].id),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(todos[index].name),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(todos[index]
                                                          .description ??
                                                      'no description'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(todos[index].userID ??
                                                      'no user'),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
