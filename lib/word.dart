import 'package:flutter/material.dart';

class Word extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Use Align if have only one child, if have multiple:
    return const Text(
      'Word of the day',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    );
  }
}
