import 'package:flutter/material.dart';

import 'home_page.dart';

class FirstMainPage extends StatelessWidget {
  const FirstMainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Self Monitor',
      /* theme: ThemeData(
        primaryColor: Colors.blue,
      ), */
      home: HomePage(title: 'Self Monitor'),
    );
  }
}
