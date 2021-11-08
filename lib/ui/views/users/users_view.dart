import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_stacked/models/User.dart';

import './users_view_model.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersViewModel>.reactive(
      viewModelBuilder: () => UsersViewModel(),
      onModelReady: (UsersViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        UsersViewModel model,
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
                        onPressed: () => model.creatUser(),
                        child: const Text('Creat User'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                        itemCount: model.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () =>
                                model.onUserClick(model.data![index].id),
                            onLongPress: () =>
                                model.onUserLongPress(model.data![index].id),
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Text(model.data?[index].id ?? 'no id'),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(model.data?[index].name ?? 'no name'),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),

                // FutureBuilder(
                //     future: model.futureToRun(),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<List<User>> users) {
                //       return Expanded(
                //         child: Container(
                //           margin: const EdgeInsets.all(16.0),
                //           padding: const EdgeInsets.all(16.0),
                //           decoration: BoxDecoration(
                //             color: Colors.blueGrey[200],
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //           child: ListView.builder(
                //               itemCount: users.data?.length ?? 0,
                //               itemBuilder: (BuildContext context, int index) {
                //                 return GestureDetector(
                //                   onTap: () =>
                //                       model.onUserClick(users.data![index].id),
                //                   onLongPress: () => model
                //                       .onUserLongPress(users.data![index].id),
                //                   child: Container(
                //                     margin: const EdgeInsets.all(8.0),
                //                     padding: const EdgeInsets.all(8.0),
                //                     decoration: BoxDecoration(
                //                       color: Colors.blueGrey[100],
                //                       borderRadius: BorderRadius.circular(20),
                //                     ),
                //                     child: Column(
                //                       children: [
                //                         Text(users.data?[index].id ?? 'no id'),
                //                         const SizedBox(
                //                           height: 8,
                //                         ),
                //                         Text(users.data?[index].name ??
                //                             'no name'),
                //                       ],
                //                     ),
                //                   ),
                //                 );
                //               }),
                //         ),
                //       );
                //     })
              ],
            ),
          ),
        );
      },
    );
  }
}
