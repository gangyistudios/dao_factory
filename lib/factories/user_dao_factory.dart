import '../daos/daos.dart';
import '../models/models.dart';

/// This class decides which UserDAO implementation to return.
/// See [UserDAOSqfLiteImpl] and [UserDAOHiveImpl].
/// This could further be abstracted using Provider so the logic
/// used to decide whether `DBType` is `hive` or `sqflite` is moved
/// out of UI code.

class UserDAOFactory {
  /// Gets the desired UserDAO implementation based on given input
  ///
  /// A real world implementation of getUserDAO might be:
  /// ```dart
  /// if (FirebaseAuth.instance.currentUser != null) {
  ///   return UserDAOFirestoreImpl();
  /// } else {
  ///   return UserDAOHiveImpl();
  /// }
  /// ```
  static Future<UserDAO> getUserDAO(DBType dbType) async {
    UserDAO userDAO;
    if (dbType == DBType.hive) {
      userDAO = UserDAOHiveImpl();
    } else {
      userDAO = UserDAOSqfLiteImpl();
    }
    await userDAO.init();
    return userDAO;
  }
}
