import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Exposures/situation_collector.dart';
import '../const.dart';
import '../custom_clipper.dart';
import 'boxes.dart';
import 'monitor_entry_dialog.dart';
import 'situation_class.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<WeightEntry> weightSaves = [];
  final ScrollController _listViewScrollController = ScrollController();
  final double _itemExtent = 50.0;
  bool isSwitched = false;

  Widget _autoSwitch() {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          print(isSwitched);
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future _openBox() async {
    await Hive.openBox<WeightEntry>('situations');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Self-Monitoring Form'),
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
          child: Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => WeightEntryDialog(
              onClickedDone: addSituation,
            ),
          ),
        ),
      );

  Widget buildContent(List<WeightEntry> transactions) => (transactions.isEmpty)
      ? Center(
          child: Text(
            'No Situations yet!',
            style: TextStyle(fontSize: 24),
          ),
        )
      : Column(
          children: [
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
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
        tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.rating.toString(),
          maxLines: 2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          transaction.experience,
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
              label: Text('Edit'),
              icon: Icon(Icons.edit),
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
              label: Text('Delete'),
              icon: Icon(Icons.delete),
              onPressed: () => deleteTransaction(transaction),
            ),
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
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
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
    // final box = Boxes.getTransactions();
    // box.delete(transaction.key);

    transaction.delete();
    //setState(() => transactions.remove(transaction));
  }
}
