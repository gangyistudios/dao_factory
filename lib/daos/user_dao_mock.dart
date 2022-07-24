import 'package:flutter_dao_factory/models/user.dart';

import 'package:flutter_dao_factory/models/db_type.dart';

import 'user_dao.dart';

class UserDAOMockImpl implements UserDAO {
  @override
  void addUser(User user) {
    // TODO: implement addUser
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  User? deleteUser(User user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  List<User> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  DBType getImplType() {
    // TODO: implement getImplType
    throw UnimplementedError();
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    throw UnimplementedError();
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
