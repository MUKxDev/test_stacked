import 'dart:developer';

import 'package:amplify_flutter/amplify.dart';
import 'package:injectable/injectable.dart';
import 'package:test_stacked/models/User.dart';

@lazySingleton
class UsersService {
  final amplify = Amplify;

  Future<bool> createUser(User user) async {
    return amplify.DataStore.save(user)
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Future<List<User>> getUsers() async {
    List<User> users = [];
    try {
      users = await amplify.DataStore.query(User.classType);
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    return users;
  }

  Future<User> getUser(String userId) async {
    User user = User();
    try {
      user = await amplify.DataStore.query(User.classType,
              where: User.ID.eq(userId))
          .then((tempUsers) {
        if (tempUsers.isNotEmpty) {
          return tempUsers[0];
        }
        return User();
      });
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    return user;
  }

  Future<bool> deleteUser(String userId) async {
    bool isDeleted = false;
    try {
      isDeleted = await amplify.DataStore.query(User.classType,
              where: User.ID.eq(userId))
          .then((tempUsers) {
        if (tempUsers.isNotEmpty) {
          amplify.DataStore.delete(tempUsers[0]);
          return true;
        } else {
          return false;
        }
      }).onError((error, stackTrace) => false);
    } catch (e) {
      log("Could not query DataStore: " + e.toString());
    }
    return isDeleted;
  }
}
