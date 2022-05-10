import 'package:flutter/material.dart';

import 'exposure_data.dart';

class SituationListItem extends StatelessWidget {
  final ExposureEntry exposureEntry;
  final int index;

  const SituationListItem(
    Key key,
    this.exposureEntry,
    this.index,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                            exposureEntry.title.toString(),
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            exposureEntry.situation.toString(),
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                      ),
                      (exposureEntry.obsession == null ||
                              exposureEntry.obsession.isEmpty)
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
                  index.toString(),
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
