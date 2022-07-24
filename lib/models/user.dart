import 'package:hive_flutter/hive_flutter.dart';
import 'package:objectbox/objectbox.dart';

part 'user.g.dart';

@Entity()
@HiveType(typeId: 1)
class User {
  /// Adding an extra field to [User] after the fact, we can see how Hive is
  /// able to work with adding new fields, just ensure the HiveField number has
  /// not yet been used and Hive handles the rest.
  ///
  /// As `id` is required for ObjectBox, but not for Hive (as it has
  /// auto-incrementing keys), we have added it in the User model as a nullable
  /// type
  @HiveField(3)
  int? id;
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  int age;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  @override
  String toString() {
    return '[firstName: $firstName, lastName: $lastName, age: $age]';
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
