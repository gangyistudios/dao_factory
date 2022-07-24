import '../models/models.dart';

/// This is the interface used to abstract implementation
/// details away. Any implementing classes will guarantee the
/// below method signatures.
abstract class UserDAO {
  /// Returns the name of the Implementation
  /// Only really used for demonstration purposes here
  String getTitle();

  /// Returns the type of the Implementation
  /// Only really used for demonstration purposes here
  DBType getImplType();

  /// Initialise dao
  Future<void> init();

  /// Returns a list of all persisted users
  List<User> getAllUsers();

  /// Returns a list of users with the given name
  List<User> getUsersByName(String name);

  /// Persists a user
  void addUser(User user);

  /// Returns the deleted user object if delete was successful, otherwise
  /// will return null if user was not found.
  User? deleteUser(User user);
}
