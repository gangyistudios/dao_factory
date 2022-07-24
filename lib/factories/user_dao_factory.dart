import '../daos/daos.dart';
import '../models/models.dart';

/// This class decides which UserDAO implementation to return.
/// See [UserDAOObjectBoxImpl] and [UserDAOHiveImpl].
/// This could further be abstracted using Provider so the logic
/// used to decide whether `DBType` is `hive` or `objectbox` is moved
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
    } else if (dbType == DBType.objectbox) {
      userDAO = UserDAOObjectBoxImpl();
    } else {
      userDAO = UserDAOMockImpl();
    }
    await userDAO.init();
    return userDAO;
  }
}
