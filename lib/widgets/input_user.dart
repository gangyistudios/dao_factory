import 'package:flutter/material.dart';

import 'widgets.dart';

/// Section which houses Add New User and Delete User forms.
class UserInput extends StatelessWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24.0, left: 24.0),
          child: Text('Perform an operation'),
        ),
        Row(
          children: const [
            NewUserForm(),
            DeleteUserForm(),
          ],
        ),
      ],
    );
  }
}
