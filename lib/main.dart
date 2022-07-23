import 'package:flutter/material.dart';

import 'dao_selection.dart';
import 'daos/daos.dart';

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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DAOSelection(
            userDAOList: userDAOList,
            selectedIndex: _selectedUserDAOIndex,
            onChanged: _setSelectedUserDAOIndex,
          ),
          const DataDisplay(),
        ],
      ),
    );
  }
}

class DataDisplay extends StatelessWidget {
  const DataDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        DisplayBox(title: 'HIVE DB'),
        DisplayBox(title: 'SQFLITE DB'),
      ],
    );
  }
}

class DisplayBox extends StatelessWidget {
  const DisplayBox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(children: [
        Text(title),
        Container(child: Placeholder()),
      ]),
    );
  }
}
