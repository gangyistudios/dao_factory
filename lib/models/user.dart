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
}
