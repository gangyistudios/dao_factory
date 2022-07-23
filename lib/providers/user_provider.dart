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

  UserProvider();

  void init() async {
    UserDAOFactory.getUserDAO(DBType.hive);
  }

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

  void addUser() async {
    /// This is only called after form was validated on submission, so we can
    /// safely assume firstName, lastName & age are populated. Hence, create new
    /// User object.
    User user = User(age: age, firstName: firstName, lastName: lastName);

    /// Add the logic required to see which impl is required here.
    /// In actual use cases, we can move that logic into the [UserDAOFactory]
    /// class, however passing the value in through the [DBType] for demonstration
    /// purposes.
    UserDAO userDao = await UserDAOFactory.getUserDAO(DBType.hive);

    /// This is what all the work was for. The application does not need to
    /// know, & does not know, what implementation is being used for [UserDAO]
    /// under the hood.
    userDao.addUser(user);
    log('added user $user');
    notifyListeners();
  }
}