import 'package:flutter/material.dart';
import 'package:ocd/Interventions/First_Intervention/intervention_tabs.dart';

class FirstInterventionPage extends StatefulWidget {


  @override
  _FirstInterventionPageState createState() => _FirstInterventionPageState();
}

class _FirstInterventionPageState extends State<FirstInterventionPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.grey[400],

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("First Session",
            style: TextStyle(color: Colors.pinkAccent[100]),
          ),
          centerTitle: true,
        ),
        body: const TabBarDemo(),
    );
  }
}


