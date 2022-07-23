import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldImpl extends StatelessWidget {
  final String labelText;
  final void Function(String?) onSaved;
  final bool? numeric;

  const TextFormFieldImpl({
    Key? key,
    required this.labelText,
    required this.onSaved,
    this.numeric,
  }) : super(key: key);

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter $labelText';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      decoration: InputDecoration(labelText: labelText),
      validator: validator,
      inputFormatters: (numeric != null && numeric == true)
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
    );
  }
}
