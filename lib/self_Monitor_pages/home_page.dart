import 'dart:async';

import 'package:flutter/material.dart';

import 'situation_class.dart';
import 'situation_entry_dialog.dart';
import 'situation_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightEntry> weightSaves = [];
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Enable Automatic Handwashing Detection',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _autoSwitch(),
            ],
          ),
          (weightSaves.isEmpty)
              ? const SizedBox(
                  child: Text(
                      'Please Press the + button to Enter a Monitored Situation'),
                  height: 40.0,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  controller: _listViewScrollController,
                  itemCount: weightSaves.length,
                  itemBuilder: (buildContext, index) {
                    return InkWell(
                        onTap: () => _editEntry(weightSaves[index]),
                        child: WeightListItem(weightSaves[index]));
                  },
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                child: Divider(
                  indent: 20.0,
                  endIndent: 10.0,
                  thickness: 1,
                ),
              ),
              Text(
                "GO TO FIRST SECTION",
                style: TextStyle(color: Colors.blueGrey),
              ),
              Expanded(
                child: Divider(
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text('Know your OCD section',
                  style: TextStyle(color: Colors.white, fontSize: 15))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddEntryDialog,
        tooltip: 'Add new self Monitored Situation',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addWeightSave(WeightEntry weightSave) {
    setState(() {
      weightSaves.add(weightSave);
      _listViewScrollController.animateTo(
        weightSaves.length * _itemExtent,
        duration: const Duration(microseconds: 1),
        curve: ElasticInCurve(0.01),
      );
    });
  }

  _editEntry(WeightEntry weightSave) {
    Navigator.of(context)
        .push(
      MaterialPageRoute<WeightEntry>(
        builder: (BuildContext context) {
          return WeightEntryDialog.edit(weightSave);
        },
        fullscreenDialog: true,
      ),
    )
        .then((newSave) {
      if (newSave != null) {
        setState(() => weightSaves[weightSaves.indexOf(weightSave)] = newSave);
      }
    });
  }

  Future _openAddEntryDialog() async {
    WeightEntry save =
        await Navigator.of(context).push(MaterialPageRoute<WeightEntry>(
            builder: (BuildContext context) {
              return WeightEntryDialog.add(
                  weightSaves.isNotEmpty ? weightSaves.last.weight : 0);
            },
            fullscreenDialog: true));
    if (save != null) {
      _addWeightSave(save);
    }
  }
}
