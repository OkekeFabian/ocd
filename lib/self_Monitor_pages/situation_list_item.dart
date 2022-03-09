import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:weight_tracker/model/weight_entry.dart';

import '../const.dart';
import '../custom_clipper.dart';
import 'situation_class.dart';

class WeightListItem extends StatelessWidget {
  final WeightEntry weightEntry;
  final int index;

  WeightListItem(
    this.weightEntry,
      this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: ClipPath(
              clipper: MyCustomClipper(clipType: ClipType.halfCircle),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.blue.withOpacity(0.1),
                ),
                height: 100,
                width: 100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icon and Hearbea
                Text(
                  index.toString()+'.',
                  textScaleFactor: 2.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            DateFormat.MMMEd().format(weightEntry.dateTime),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants.textPrimary),
                          ),
                          Text(
                            TimeOfDay.fromDateTime(weightEntry.dateTime)
                                .toString(),
                            style: TextStyle(
                                fontSize: 15, color: Constants.textPrimary),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 6,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          shape: BoxShape.rectangle,
                          color: Color(0xFFD9E2EC),
                        ),
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Stack(
                            children: [
                              Positioned(
                                left: 0,
                                child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      shape: BoxShape.rectangle,
                                      color: Colors.redAccent,
                                    ),
                                    width: constraints.maxWidth * (weightEntry.weight / 10),
                                    height: 6),
                              )
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
