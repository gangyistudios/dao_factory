import '../models/user.dart';

/// This is the interface used to abstract implementation
/// details away. Any implementing classes will guarantee the
/// below method signatures.
abstract class UserDAO {
  /// Returns the name of the Implementation
  String getTitle();

  /// Returns a list of all persisted users
  List<User> getUsers();

  /// Returns a list of users with the given name
  List<User> getUsersByName(String name);

  /// Persists a user
  void addUser(User user);

  /// Deletes the given user
  void deleteUser(User user);
}
