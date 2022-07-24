import 'dart:developer';
import 'package:collection/collection.dart';

import '../models/models.dart';
import '../objectbox.g.dart';
import 'user_dao.dart';

/// Make singleton so we only initialise once per lifecycle.
class UserDAOObjectBoxImpl implements UserDAO {
  /// Store is specific to the ObjectBox implementation
  late Store store;

  /// Note this Box type is as defined in the objectbox package.
  late final Box<User> userBox;
  bool _isObjectBoxInit = false;

  /// Singleton implementation
  static final UserDAOObjectBoxImpl _instance =
      UserDAOObjectBoxImpl._privateConstructor();

  /// Empty private constructor, as we are initialising the async init() in a
  /// separate call.
  UserDAOObjectBoxImpl._privateConstructor();

  factory UserDAOObjectBoxImpl() {
    return _instance;
  }

  /// Should only be initialised once the first time the Singleton is accessed,
  /// from then on the cached DAOImpl instance is returned.
  @override
  Future<void> init() async {
    if (!_isObjectBoxInit) {
      log('initialising UserDAOObjectBoxImpl singleton');
      store = await openStore();
      userBox = store.box<User>();
      _isObjectBoxInit = true;
      log('initialised UserDAOObjectBoxImpl singleton');
    }
  }

  @override
  String getTitle() {
    return 'UserDAOObjectBoxImpl';
  }

  @override
  DBType getImplType() {
    return DBType.objectbox;
  }

  @override
  List<User> getAllUsers() {
    return userBox.getAll();
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    // Left as exercise for the reader.
    throw UnimplementedError();
  }

  @override
  void addUser(User user) {
    userBox.put(user);
  }

  @override
  User? deleteUser(User user) {
    List<User?> users = getAllUsers();
    User? userToDelete = users.lastWhereOrNull(
      (k) => k == user,
    );
    if (userToDelete != null) {
      //// As ObjectBox automatically assigns an id if none is passed, after
      /// retrieving the first match from the box, we get its id to delete
      userBox.remove(userToDelete.id!);
      return user;
    } else {
      return null;
    }
  }

  /// Although the objectbox implementation for clear() does not involve any
  /// asynchrony, because Hive does, we have added that additional layer of
  /// complexity here. A small price to pay for the abstraction...
  @override
  Future<void> clear() async {
    userBox.removeAll();
  }
}
