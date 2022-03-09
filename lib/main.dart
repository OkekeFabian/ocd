import 'package:flutter/material.dart';
import 'package:ocd/About/about_main.dart';

import 'package:ocd/word.dart';

import 'About/detail_page.dart';
import 'const.dart';
import 'custom_clipper.dart';
import 'first_slider.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'App Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Theme.of(context).accentColor,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),
          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),
          Padding(
          padding: EdgeInsets.all(Constants.paddingSide),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Good Morning,\nPatient",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  CircleAvatar(
                      radius: 35.0,
                      backgroundImage:
                      AssetImage('assets/profile_picture.png'))
                ],
              ),
              //Word(),
              //Page1(),
              const MainPageSlider(),
            ],
          ),
        ),]
      ),
      floatingActionButton: ElevatedButton.icon(
        label: const Text('Click to know about App'),
        icon: const Icon(Icons.announcement),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage()),
          );
        },
      ),
    );
  }
}
