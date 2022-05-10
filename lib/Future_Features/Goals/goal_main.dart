import 'package:flutter/material.dart';

import 'long_term.dart';
import 'mid_term.dart';
import 'short_term.dart';

class GoalsBar extends StatelessWidget {
  const GoalsBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('Short term goal')),
                Tab(icon: Text('Middle term goal')),
                Tab(icon: Text('Long term goal')),
              ],
            ),
            title: const Text('Goals'),
          ),
          body: TabBarView(
            children: [ShortTermList(), MidTermList(), LongTermList()],
          ),
        ),
      ),
    );
  }
}
