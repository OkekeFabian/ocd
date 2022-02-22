import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:weight_tracker/model/weight_entry.dart';

import 'situation_class.dart';

class WeightListItem extends StatelessWidget {
  final WeightEntry weightEntry;

  WeightListItem(
    this.weightEntry,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            DateFormat.MMMEd().format(weightEntry.dateTime),
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            TimeOfDay.fromDateTime(weightEntry.dateTime)
                                .toString(),
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                      ),
                      (weightEntry.note == null || weightEntry.note.isEmpty)
                          ? Container(
                              height: 0.0,
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Icon(
                                Icons.speaker_notes,
                                color: Colors.grey[300],
                                size: 16.0,
                              ),
                            ),
                    ],
                  ),
                ),
                Text(
                  weightEntry.weight.toString(),
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
