import 'package:flutter/material.dart';

import '../daos/daos.dart';
import '../providers/providers.dart';
import 'widgets.dart';

/// Widget to visualise the data stored within Hive & ObjectBox DBs.
class DatabasesView extends StatelessWidget {
  final List<UserDAO> userDAOList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const DatabasesView({
    super.key,
    required this.userDAOList,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < userDAOList.length; i++)
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClearButton(
                onPressed: () async =>
                    await Provider.of<UserProvider>(context, listen: false)
                        .clearAll(userDAOList[i].getImplType()),
              ),
              RadioListTile(
                title: Text(userDAOList[i].getTitle()),
                value: i,
                groupValue: selectedIndex,
                selected: i == selectedIndex,
                activeColor: Colors.black,
                onChanged: onChanged,
              ),
              DisplayBox(
                dbType: userDAOList[i].getImplType(),
              ),
            ],
          )),
      ],
    );
  }
}
