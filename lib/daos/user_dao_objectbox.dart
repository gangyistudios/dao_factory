import 'dart:developer';

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
  void addUser(User user) {
    userBox.put(user);
  }

  @override
  User? deleteUser(User user) {
    // List<User> users = getAllUsers();
    // int? id = users.firstWhere(
    //   (k) => k == user,
    //   orElse: () => null,
    // );
  }

  @override
  List<User> getAllUsers() {
    return userBox.getAll();
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}
