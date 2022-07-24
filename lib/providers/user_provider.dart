import 'dart:developer';

import 'package:flutter/material.dart';

import '../daos/daos.dart';
import '../factories/factories.dart';
import '../models/models.dart';

/// Encapsulates logic required to detect the appropriate
/// UserDAO implementation before calling the UserFactory
///
/// Also handles submission New User Form
class UserProvider extends ChangeNotifier {
  late String _firstName;
  late String _lastName;
  late int _age;

  /// Default DB type is Hive
  DBType _dbType = DBType.hive;

  UserProvider();

  String get firstName {
    return _firstName;
  }

  set firstName(String firstName) {
    log('setting firstName to $firstName');
    _firstName = firstName;
  }

  String get lastName {
    return _lastName;
  }

  set lastName(String lastName) {
    log('setting lastName to $lastName');
    _lastName = lastName;
  }

  int get age {
    return _age;
  }

  set age(int age) {
    log('setting age to $age');
    _age = age;
  }

  DBType get dbType {
    return _dbType;
  }

  set dbType(DBType dbType) {
    log('setting dbType to $dbType');
    _dbType = dbType;
  }

  /// Adds a user to the persistence layer.
  /// Actual implementation details of the persistence layer are abstracted away
  /// from this class, instead defined in [UserDAOFactory].
  /// This also allows us to easily create and inject a mock DAO for testing.
  ///
  /// Returns a string of the result.
  Future<String> addUser() async {
    /// This is only called after form was validated on submission, so we can
    /// safely assume firstName, lastName & age are populated. Hence, create new
    /// User object.
    User user = User(age: age, firstName: firstName, lastName: lastName);

    /// Add the logic required to see which impl is required here.
    /// In actual use cases, we can move that logic into the [UserDAOFactory]
    /// class, however passing the value in through the [DBType] for demonstration
    /// purposes.

    /// This is what all the work was for. (in real use cases we would not pass
    /// dbType here and instead encapsulate that logic into the Factory class -
    /// that is for demo only). The application does not need to
    /// know, & does not know, what implementation is being used for [UserDAO]
    /// under the hood.
    await UserDAOFactory.getUserDAO(dbType).then(
      (userDAO) => userDAO.addUser(user),
    );
    notifyListeners();
    return 'Added user $user';
  }

  /// Passing the dbType here for demonstration purposes, usually this would be
  /// encapsulated completely within this class itself.
  Future<List<User>> getUsers(DBType dbType) async {
    UserDAO userDao = await UserDAOFactory.getUserDAO(dbType);
    List<User> users = userDao.getAllUsers();
    return users;
  }

  /// See [addUser] for comments.
  ///
  /// Returns the a String of the result
  Future<String> deleteUser() async {
    User user = User(age: age, firstName: firstName, lastName: lastName);
    UserDAO userDao = await UserDAOFactory.getUserDAO(dbType);
    User? deletedUser = userDao.deleteUser(user);
    notifyListeners();
    return deletedUser != null
        ? 'Deleted user $deletedUser'
        : 'User was not found!';
  }

  /// Clears all users from the currently selected DAO Implementation
  ///
  /// Passing the dbType here for demonstration purposes, usually this would be
  /// encapsulated completely within this class itself. I.e., we would just pick
  /// the value of dbType as is done in [deleteUser] and [addUser]
  Future<void> clearAll(DBType dbType) async {
    UserDAO userDao = await UserDAOFactory.getUserDAO(dbType);
    await userDao.clear();
    notifyListeners();
  }
}
