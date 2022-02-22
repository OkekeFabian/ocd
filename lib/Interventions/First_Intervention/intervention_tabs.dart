import 'package:flutter/material.dart';
import 'package:ocd/Interventions/First_Intervention/first_intervention_act.dart';
import 'package:ocd/Interventions/First_Intervention/first_intervention_erp.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('Contents')),
                Tab(icon: Text('Data')),
              ],
            ),
            title: const Text('SESSION 1'),
          ),
          body: const TabBarView(
            children: [
              FirstInterventionAct(),
              FirstInterventionErp(),
            ],
          ),
        ),
      ),
    );
  }
}