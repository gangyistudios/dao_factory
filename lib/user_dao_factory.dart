import 'daos/daos.dart';

/// This class decides which UserDAO implementation to return.
/// See [UserDAOSqfLiteImpl] and [UserDAOHiveImpl].
/// This could further be abstracted using Provider so the logic
/// used to decide whether `DBType` is `hive` or `sqflite` is moved
/// out of UI code.

enum DBType { hive, sqflite }

class UserDAOFactory {
  static UserDAO getUserDAO(DBType type) {
    if (type == DBType.hive) {
      return UserDAOHiveImpl();
    } else {
      return UserDAOSqfLiteImpl();
    }
  }
}
