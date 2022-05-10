import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'boxes.dart';
import 'monitor_entry_dialog.dart';
import 'situation_class.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<WeightEntry> weightSaves = [];
  final double _itemExtent = 50.0;
  bool isSwitched = false;

  Widget _autoSwitch() {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }

  @override
  void dispose() {
    Hive.box('situations').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Self-Monitoring Form'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<Box<WeightEntry>>(
          valueListenable: Boxes.getSituations().listenable(),
          builder: (context, box, _) {
            final situations = box.values.toList().cast<WeightEntry>();

            return buildContent(situations);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => WeightEntryDialog(
              onClickedDone: addSituation,
            ),
          ),
        ),
      );

  Widget buildContent(List<WeightEntry> transactions) => (transactions.isEmpty)
      ? const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No Situations yet! Click the button to add a monitored Situation.',
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      : Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, int index) {
                  final transaction = transactions[index];

                  return buildTransaction(context, transaction);
                },
              ),
            ),
          ],
        );

  Widget buildTransaction(
    BuildContext context,
    WeightEntry transaction,
  ) {
    final date = DateFormat.yMMMd().format(transaction.dateTime);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.experience,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          transaction.rating.toString(),
          style: const TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: [
          buildButtons(context, transaction),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context, WeightEntry transaction) => Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: const Text('Edit'),
              icon: const Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WeightEntryDialog(
                    weightEntry: transaction,
                    onClickedDone:
                        (dateTime, rating, experience, response, result) =>
                            editTransaction(transaction, dateTime, rating,
                                experience, response, result),
                  ),
                  fullscreenDialog: true,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton.icon(
                label: const Text('Delete'),
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteTransaction(transaction);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('A monitored situation has been deleted')));
                }),
          )
        ],
      );

  Future addSituation(DateTime dateTime, int rating, String experience,
      String response, String result) async {
    final situation = WeightEntry()
      ..dateTime = DateTime.now()
      ..rating = rating
      ..experience = experience
      ..response = response
      ..result = result;

    final box = Boxes.getSituations();
    box.add(situation);
  }

  void editTransaction(WeightEntry weightSave, DateTime dateTime, int rating,
      String experience, String response, String result) {
    weightSave.dateTime = dateTime;
    weightSave.rating = rating;
    weightSave.experience = experience;
    weightSave.response = response;
    weightSave.result = result;

    // final box = Boxes.getTransactions();
    // box.put(transaction.key, transaction);

    weightSave.save();
  }

  void deleteTransaction(WeightEntry transaction) {
    transaction.delete();
    //setState(() => transactions.remove(transaction));
  }
}
