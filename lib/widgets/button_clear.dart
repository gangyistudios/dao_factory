import 'package:flutter/material.dart';

class ClearButton extends StatefulWidget {
  const ClearButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  State<ClearButton> createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Cleared')),
            );
        },
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: Icon(Icons.delete),
      ),
    );
  }
}
