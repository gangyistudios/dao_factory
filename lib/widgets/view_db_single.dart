import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import 'widgets.dart';

/// Sub component of the DB Views section, for a single DB
class DisplayBox extends StatelessWidget {
  const DisplayBox({
    Key? key,
    required this.dbType,
  }) : super(key: key);

  final DBType dbType;

  @override
  Widget build(BuildContext context) {
    /// Wrapping in a consumer so that the DB viz is subscribed to any changes
    /// and then returning a Futurebuilder as getUsers() is an async method.
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) => FutureBuilder<List<User>>(
        future: userProvider.getUsers(dbType),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                snapshot.hasData && snapshot.data!.isNotEmpty
                    ? Column(
                        children: snapshot.data!
                            .map((user) => Text(user.toString()))
                            .toList(),
                      )
                    : const Text('Add some data!'),
              ],
            ),
          );
        },
      ),
    );
  }
}
