# Dao Factory Design Pattern in Flutter

Implementing the dao factory pattern in Flutter. 

Demonstrates the use of varied DAO implementations as defined in a configuration file, as well as switching the DAO  implmentation during runtime. 

References: 
https://refactoring.guru/design-patterns/factory-method
https://medium.com/flutter-community/flutter-design-patterns-10-factory-method-c53ad11d863f 
https://stackoverflow.com/questions/6401543/what-is-dao-factory-pattern

## Introduction
- You may want to use different persistence providers depending on the state of the app, or the platform. I.e. suppose there was a situation where:
    - you had to use Hive for Android platform, and SQFLite for Ios. 
    - you had to use Hive if a User was not signed in, but once they were signed in, you would rather use Firestore.
- Rather than scattering conditionals throughout your code, we can separate the implementation details of our persistence layer away from the application code using the Factory pattern. 
- For ease of demonstration, this example uses 2 local storage implementations - Hive & sqflite, for the purposes of persisting a User object. 
- If you wanted to switch out the DAO implementation for unit testing, this would then become as simple as creating a new DAOImpl that implments the `UserDAO` interface, and then wiring up a switch in `UserDAOFactory` to return a mockDAO, i.e. `if (isTest == true) return UserDAOMockImpl();`

## Implementation 
1. Create a DAOFactory class. 
2. This class will contain a getDAO method which returns the appropriate DAO implementation class based on some input. 
```dart
public static DAO getDAO(String type) {
    if (type == 'hive') {
        return DAOHiveImpl();
    } else {
        return DAOSQFLiteImpl();
    }
}
```
3. Create a DAO interface. (Abstract class in  Dart). 
4. Create your DAO implementation classes, i.e. one for Hive & one for Firestore, which `implement` the DAO interface, ensuring they have the same guaranteed functionalities. 
5. From the application code, we can make an implementation-agnostic call to the persistence layer, letting the `UserDAOFactory` object decide which DAO implementation to use.: 
```dart
UserDAOFactory.getUserDAO().addUser();
```

## Feedback 
Please feel free to comment any better solutions or feedback. We are always open for new ideas!




