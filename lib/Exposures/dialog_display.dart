import 'package:flutter/material.dart';
import 'package:ocd/Exposures/exposure_data.dart';

import 'package:ocd/General Information/constants.dart';

class SituationDetailPage extends StatelessWidget {
  SituationDetailPage({Key key, this.exposureEntry, this.index})
      : super(key: key);

  final ExposureEntry exposureEntry;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 300),
                        Text(
                          exposureEntry.title.toString(),
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 35,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          exposureEntry.situation.toString(),
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 20),
                        Text(
                          'Obsession',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 12),
                        Text(
                          exposureEntry.obsession ?? '',
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(color: Colors.blue),
                        const SizedBox(height: 10),
                        Text(
                          'Thought',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Divider(color: Colors.black),
                        Text(
                          exposureEntry.thought.toString() ?? '',
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(color: Colors.blue),
                        SizedBox(height: 10),
                        Text(
                          'Disgust',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Divider(color: Colors.black),
                        Text(
                          exposureEntry.disgust.toString() ?? '',
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(color: Colors.blue),
                        SizedBox(height: 10),
                        Text(
                          'Avoidance',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Divider(color: Colors.black),
                        Text(
                          exposureEntry.avoidance.toString() ?? '',
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(color: Colors.blue),
                        SizedBox(height: 10),
                        Text(
                          'Ritual',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Divider(color: Colors.black),
                        Text(
                          exposureEntry.ritual.toString() ?? '',
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(color: Colors.blue),
                        SizedBox(height: 10),
                        Text(
                          'Mental Rituals',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 30,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 4),
                        Divider(color: Colors.black),
                        Text(
                          exposureEntry.mental.toString() ?? '',
                          maxLines: 25,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /* Positioned(
              right: -64,
              child: Hero(
                  tag: exposureEntry.position,
                  child: Image.asset(exposureEntry.iconImage)),
            ), */
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                index.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
