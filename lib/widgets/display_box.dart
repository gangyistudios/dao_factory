import 'package:flutter/material.dart';

class DisplayBox extends StatelessWidget {
  const DisplayBox({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(children: [
        Text(title),
        Container(child: Placeholder()),
      ]),
    );
  }
}
