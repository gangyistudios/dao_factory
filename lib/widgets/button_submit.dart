import 'package:flutter/material.dart';

import '../providers/providers.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            /// Trigger the onSaved callbacks of each FormField, which populates
            /// the UserProvider's age, firstName & lastName variables, which are
            /// then persisted through a call to its addUser() method.
            _formKey.currentState!.save();
            Provider.of<UserProvider>(context, listen: false).addUser();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Saved')),
            );
          }
        },
        child: const Text('Submit'),
      ),
    );
  }
}
