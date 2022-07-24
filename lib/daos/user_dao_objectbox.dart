import '../models/models.dart';
import 'user_dao.dart';

class UserDAOObjectBoxImpl implements UserDAO {
  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
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
    // TODO: implement addUser
  }

  @override
  User? deleteUser(User user) {
    // TODO: implement deleteUser
  }

  @override
  List<User> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  List<User> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}
