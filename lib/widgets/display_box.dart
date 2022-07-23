import 'package:flutter/material.dart';

import '../providers/providers.dart';

class DisplayBox extends StatelessWidget {
  const DisplayBox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    /// Wrapping in a consumer so that the DB viz is subscribed to any changes
    /// and then returning a Futurebuilder as getUsers() is an async method.
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) => FutureBuilder(
        future: userProvider.getUsers(),
        builder: (context, snapshot) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(title),
              Container(
                child: Text(
                  snapshot.hasData ? snapshot.data.toString() : 'Loading',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
