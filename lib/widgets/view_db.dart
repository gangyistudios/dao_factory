import 'package:flutter/material.dart';

import '../daos/daos.dart';
import 'widgets.dart';

/// Widget to visualise the data stored within Hive & ObjectBox DBs.
class DatabasesView extends StatelessWidget {
  const DatabasesView({Key? key, required this.userDAOList}) : super(key: key);

  final List<UserDAO> userDAOList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (UserDAO userDao in userDAOList)
          DisplayBox(title: userDao.getTitle(), dbType: userDao.getImplType()),
      ],
    );
  }
}
