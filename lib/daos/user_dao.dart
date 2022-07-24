import '../models/user.dart';

/// This is the interface used to abstract implementation
/// details away. Any implementing classes will guarantee the
/// below method signatures.
abstract class UserDAO {
  /// Returns the name of the Implementation
  String getTitle();

  /// Initialise dao
  Future<void> init();

  /// Returns a list of all persisted users
  List<User> getUsers();

  /// Returns a list of users with the given name
  List<User> getUsersByName(String name);

  /// Persists a user
  void addUser(User user);

  /// Returns the deleted user object if delete was successful, otherwise
  /// will return null if user was not found.
  User? deleteUser(User user);
}
