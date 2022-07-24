import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.onSubmit,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Future<String> Function() onSubmit;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          if (widget._formKey.currentState!.validate()) {
            /// Trigger the onSaved callbacks of each FormField, which populates
            /// the UserProvider's age, firstName & lastName variables, which are
            /// then persisted through a call to its addUser() method.
            widget._formKey.currentState!.save();

            /// After saving the form, call the provided onSubmit callback.
            String result = await widget.onSubmit();

            // When a BuildContext is used from a StatefulWidget, the mounted property
            // must be checked after an asynchronous gap.
            if (!mounted) return;
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(result)),
              );
          }
        },
        child: const Text('Submit'),
      ),
    );
  }
}
