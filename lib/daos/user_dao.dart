import '../models/models.dart';

/// This is the interface used to abstract implementation
/// details away. Any implementing classes will guarantee the
/// below method signatures.
abstract class UserDAO {
  /// Initialise dao
  Future<void> init();

  /// Returns the name of the Implementation
  /// Only really used for demonstration purposes here
  String getTitle();

  /// Returns the type of the Implementation
  /// Only really used for demonstration purposes here
  DBType getImplType();

  /// Returns a list of all persisted users
  List<User> getAllUsers();

  /// Returns a list of users with the given name
  List<User> getUsersByName(String name);

  /// Persists a user
  void addUser(User user);

  /// Returns the deleted user object if delete was successful, otherwise
  /// will return null if user was not found.
  User? deleteUser(User user);

  /// Clears/Deletes all persisted users
  ///
  /// Although 2 out of 3 implementations in this example do not involve any
  /// asynchrony, we need to return a Future due to Hive's clear implementation
  /// requiring an await. Small price to pay for abstraction.
  Future<void> clear();
}
