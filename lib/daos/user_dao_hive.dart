import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';
import 'user_dao.dart';

class UserDAOHiveImpl implements UserDAO {
  /// Note this Box type is as defined in the hive_flutter package.
  late final Box<User> userBox;
  bool _isHiveInit = false;

  /// Singleton implementation
  static final UserDAOHiveImpl _instance =
      UserDAOHiveImpl._privateConstructor();

  /// Empty private constructor, as we are initialising the async init() in a
  /// separate call.
  UserDAOHiveImpl._privateConstructor();

  factory UserDAOHiveImpl() {
    return _instance;
  }

  /// Should only be initialised once the first time the Singleton is accessed,
  /// from then on the cached DAOImpl instance is returned.
  @override
  Future<void> init() async {
    if (!_isHiveInit) {
      log('initialising UserDAOHiveImpl singleton');
      await Hive.initFlutter('hiveDb');
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(UserAdapter());
      }
      userBox = await Hive.openBox<User>('userBox');
      _isHiveInit = true;
      log('initialising UserDAOHiveImpl singleton');
    }
  }

  @override
  String getTitle() {
    return 'UserDAOHiveImpl';
  }

  @override
  DBType getImplType() {
    return DBType.hive;
  }

  @override
  void addUser(User user) {
    userBox.add(user);
  }

  @override
  User? deleteUser(User user) {
    Map<dynamic, User> userMap = userBox.toMap();
    int? key = userMap.keys.firstWhereOrNull(
      (k) => userMap[k] == user,
    );
    if (key != null) {
      userBox.delete(key);
      return user;
    } else {
      return null;
    }
  }

  @override
  List<User> getAllUsers() {
    List<User> users = userBox.toMap().values.toList();
    return users;
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}
