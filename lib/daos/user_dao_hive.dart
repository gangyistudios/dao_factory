import 'package:flutter_dao_factory/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'user_dao.dart';

class UserDAOHiveImpl implements UserDAO {
  late final Box<User> userBox;
  bool _isHiveInit = false;

  @override
  Future<void> init() async {
    if (!_isHiveInit) {
      await Hive.initFlutter('hiveDb');
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(UserAdapter());
      }
      userBox = await Hive.openBox<User>('userBox');
      _isHiveInit = true;
    }
  }

  @override
  String getTitle() {
    return 'UserDAOHiveImpl';
  }

  @override
  void addUser(User user) {
    userBox.add(user);
  }

  @override
  void deleteUser(User user) {
    Map<dynamic, User> userMap = userBox.toMap();
    String key = userMap.keys.firstWhere(
      (k) => userMap[k] == user,
      orElse: () => null,
    );
    userBox.delete(key);
  }

  @override
  List<User> getUsers() {
    List<User> users = userBox.toMap().values.toList();
    return users;
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}
