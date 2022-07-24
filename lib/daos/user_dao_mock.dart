import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter_dao_factory/models/user.dart';

import 'package:flutter_dao_factory/models/db_type.dart';

import 'user_dao.dart';

/// For our mock implementation we will simply store our Users in a Map<int, User>,
/// where the key is the User id, which maps to the User object itself.
class UserDAOMockImpl implements UserDAO {
  late Map<int, User> userMap = <int, User>{};
  int nextId = 0;

  /// Singleton implementation
  static final UserDAOMockImpl _instance =
      UserDAOMockImpl._privateConstructor();

  /// Empty private constructor, as we are initialising the async init() in a
  /// separate call.
  UserDAOMockImpl._privateConstructor();

  factory UserDAOMockImpl() {
    return _instance;
  }

  @override
  Future<void> init() async {}

  @override
  String getTitle() {
    return 'UserDAOMockImpl';
  }

  @override
  DBType getImplType() {
    return DBType.mock;
  }

  @override
  List<User> getAllUsers() {
    return userMap.values.toList();
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    // Left as exercise for the reader.
    throw UnimplementedError();
  }

  @override
  void addUser(User user) {
    user.id = nextId;
    userMap[nextId] = user;
    nextId++;
  }

  @override
  User? deleteUser(User user) {
    User? userToDelete = userMap.values.toList().lastWhereOrNull(
          (k) => k == user,
        );
    log(userToDelete.toString());
    User? deletedUser = userMap.remove(userToDelete?.id);
    return deletedUser;
  }

  /// Although the mockDao implementation for clear() does not involve any
  /// asynchrony, because Hive does, we have added that additional layer of
  /// complexity here. A small price to pay for the abstraction...
  @override
  Future<void> clear() async {
    userMap = <int, User>{};
    nextId = 0;
  }
}
