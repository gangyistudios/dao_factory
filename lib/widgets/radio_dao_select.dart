import 'package:flutter/material.dart';

import '../daos/daos.dart';

/// Convenience widget to demonstrate selecting
/// bewteen UserDAO implementations.
class DAOSelection extends StatelessWidget {
  final List<UserDAO> userDAOList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const DAOSelection({
    super.key,
    required this.userDAOList,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text('Select Hive or ObjectBox Implementation for UserDAO'),
        ),
        for (var i = 0; i < userDAOList.length; i++)
          RadioListTile(
            title: Text(userDAOList[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
