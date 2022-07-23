# flutter_dao_factory

Implementing the dao factory pattern in Flutter. 

References: 
https://refactoring.guru/design-patterns/factory-method
https://medium.com/flutter-community/flutter-design-patterns-10-factory-method-c53ad11d863f 
https://stackoverflow.com/questions/6401543/what-is-dao-factory-pattern

## Possible use case 
- You may want to use different persistence providers depending on the state of the app, or the platform. I.e. suppose there was a situation where you had to use Hive for Android platform, and SQFLite for Ios. 
- Rather than scattering conditionals throughout your code, we can separate the implementation details of our persistence layer away from the application code using the Factory pattern. 
- For ease of demonstration, this example uses 2 local storage implementations - Hive & sqflite, for the purposes of persisting a User object. 

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
5. Before making any calls to the persistence layer, check whether the user is logged in, and use the factory method to retrieve and use the desired DAO implemenation. 
