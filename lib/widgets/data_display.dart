import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

/// Widget to visualise the data stored within Hive & ObjectBox DBs.
class DataDisplay extends StatelessWidget {
  const DataDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        DisplayBox(title: 'HIVE DB', dbType: DBType.hive),
        DisplayBox(title: 'OBJECTBOX DB', dbType: DBType.objectbox),
      ],
    );
  }
}
