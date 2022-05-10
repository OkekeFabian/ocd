import 'package:flutter/material.dart';

import 'First_Intervention/first_main.dart';

class InterventionPage extends StatefulWidget {
  const InterventionPage({Key key}) : super(key: key);

  @override
  _InterventionPageState createState() => _InterventionPageState();
}

class _InterventionPageState extends State<InterventionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Intervention Sessions",
            style: TextStyle(color: Colors.pinkAccent[100]),
          ),
          centerTitle: true,
        ),
        body: ElevatedButton(
          style: ElevatedButton.styleFrom(onSurface: Colors.red),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirstInterventionPage()),
            );
          },
          child: const Text('First session'),
        ));
  }
}
