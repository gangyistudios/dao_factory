import 'package:flutter/material.dart';

import 'widgets.dart';

/// Widget to visualise the data stored within Hive & Sqflite DBs.
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
