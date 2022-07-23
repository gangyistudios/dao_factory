import 'package:flutter/material.dart';

import 'dao_selection.dart';
import 'daos/daos.dart';
import 'providers/providers.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'DAO Factory Example',
      home: DAOFactoryExample(),
    );
  }
}

class DAOFactoryExample extends StatefulWidget {
  const DAOFactoryExample({Key? key}) : super(key: key);

  @override
  State<DAOFactoryExample> createState() => _DAOFactoryExampleState();
}

class _DAOFactoryExampleState extends State<DAOFactoryExample> {
  final List<UserDAO> userDAOList = [
    UserDAOHiveImpl(),
    UserDAOSqfLiteImpl(),
  ];

  int _selectedUserDAOIndex = 0;

  void _setSelectedUserDAOIndex(int? index) {
    setState(() {
      _selectedUserDAOIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserProvider(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DAOSelection(
              userDAOList: userDAOList,
              selectedIndex: _selectedUserDAOIndex,
              onChanged: _setSelectedUserDAOIndex,
            ),
            const NewUserForm(),
            const DataDisplay(),
          ],
        ),
      ),
    );
  }
}
