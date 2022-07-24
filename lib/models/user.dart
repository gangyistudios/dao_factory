import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  int age;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  @override
  String toString() {
    return 'User[firstName: $firstName, lastName: $lastName, age: $age]';
  }

  /// Overwrite comparison methods, so User with same firstName, lastName, age
  /// are considered equal.
  ///
  /// Potentially use the [freezed](https://pub.dev/packages/freezed) package
  /// here to save boilerplate code for larger applications, or use dataclass as
  /// in Python?
  @override
  bool operator ==(Object other) {
    return other is User &&
        other.runtimeType == runtimeType &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.age == age;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      firstName,
      lastName,
      age,
    );
  }
}
