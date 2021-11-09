import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
          appBar: AppBar(
            title: const Text('Single Future Users'),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => model.createUser(),
                        child: const Text('Create User'),
                      ),
                    ],
                  ),
                ),
                _instructionsWidget(),
                model.isBusy
                    ? _busyWidget()
                    : (model.data!.isEmpty
                        ? _emptyUsersWidget()
                        : _usersWidget(context, model)),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded _usersWidget(BuildContext context, UsersViewModel model) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.separated(
          itemCount: model.data?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => model.onUserClick(model.data![index].id),
              onLongPress: () => model.onUserLongPress(model.data![index].id),
              onDoubleTap: () =>
                  model.navigateToTodosStream(model.data![index].id),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.background.withAlpha(150),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(model.data?[index].image ??
                              'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            model.data?[index].id ?? 'no id',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Divider(),
                          Text(model.data?[index].name ?? 'no name'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }

  Padding _instructionsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          Text(
            'Instructions',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          Text('click on user to go to todo'),
          Divider(),
          Text('double click on user to go to todo stream'),
          Divider(),
          Text('hold a user to delete the user'),
        ],
      ),
    );
  }

  Expanded _emptyUsersWidget() {
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
            child: Text('There are no users'),
          )),
    );
  }

  Expanded _busyWidget() {
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
            child: CircularProgressIndicator(),
          )),
    );
  }
}
