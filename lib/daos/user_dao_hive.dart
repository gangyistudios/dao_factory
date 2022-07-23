import 'package:flutter_dao_factory/models/user.dart';

import 'user_dao.dart';

class UserDAOHiveImpl implements UserDAO {
  @override
  String getTitle() {
    return 'UserDAOHiveImpl';
  }

  @override
  void addUser(User user) {
    // TODO: implement addUser
  }

  @override
  void deleteUser(User user) {
    // TODO: implement deleteUser
  }

  @override
  List<User> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}
