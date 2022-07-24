import 'package:flutter/material.dart';

import '../providers/providers.dart';
import 'widgets.dart';

// Create a Form widget.
class DeleteUserForm extends StatefulWidget {
  const DeleteUserForm({super.key});

  @override
  DeleteUserFormState createState() {
    return DeleteUserFormState();
  }
}

class DeleteUserFormState extends State<DeleteUserForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: 200,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Delete User'),
              TextFormFieldImpl(
                labelText: 'First name',
                onSaved: (value) => userProvider.firstName = value!,
              ),
              TextFormFieldImpl(
                labelText: 'Last name',
                onSaved: (value) => userProvider.lastName = value!,
              ),
              TextFormFieldImpl(
                labelText: 'Age',
                onSaved: (value) => userProvider.age = int.parse(value!),
                numeric: true,
              ),
              SubmitButton(
                  formKey: _formKey, onSubmit: userProvider.deleteUser),
            ],
          ),
        ),
      ),
    );
  }
}
