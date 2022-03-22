import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lottie/lottie.dart';
import 'package:ocd/Exposures/exposure_data.dart';
import 'package:ocd/General%20Information/main_page.dart';
import 'package:ocd/Exposures/question_stepper.dart';

import 'dialog_display.dart';
import 'situation_list.dart';

class SituationPage extends StatefulWidget {
  const SituationPage({
    Key key,
  }) : super(key: key);

  @override
  _SituationPageState createState() => _SituationPageState();
}

class _SituationPageState extends State<SituationPage> {
  List<ExposureEntry> exposureSaves = [];
  final ScrollController _listViewScrollController = ScrollController();
  List<String> topicOptions = [];
  final situationController = TextEditingController();
  final topicController = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blue,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  Widget _buildImage(String assetName) {
    return Align(
      child: Lottie.asset(assetName, width: 200.0),
      alignment: Alignment.bottomCenter,
    );
  }

  var cardTextStyle = const TextStyle(
      fontFamily: "Montserrat Regular", fontSize: 14, color: Colors.white);

  addList() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              QuestionPage(situationController.text, topicController.text)),
    );

    topicOptions.add(topicController.text);
    topicController.clear();
    situationController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Situation Area",
          style: TextStyle(color: Colors.pinkAccent[100]),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: KeyboardDismisser(
          gestures: const [GestureType.onTap],
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: KeyboardDismisser(
                gestures: const [GestureType.onTap],
                child: Column(
                  children: [
                    const SizedBox(height: 10),
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
                          "List of Situations Recorded",
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
                    const SizedBox(
                      height: 20,
                    ),
                    (exposureSaves.isEmpty)
                        ? Container(
                            child: const Text(
                                'List of Situations will appear here'),
                            height: 20.0,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            controller: _listViewScrollController,
                            itemCount: exposureSaves.length,
                            itemBuilder: (buildContext, index) {
                              return Column(
                                children: [
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, a, b) =>
                                                  SituationDetailPage(
                                                    exposureEntry:
                                                        exposureSaves[index],
                                                    index: index + 1,
                                                  )));
                                    },
                                    child: SituationListItem(
                                        exposureSaves[index], index + 1),
                                  ),
                                ],
                              );
                            },
                          ),

                    const SizedBox(
                      height: 20,
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
                          "Situation Steps",
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          controller: topicController,
                          decoration: InputDecoration(
                            hintText: 'e.g ',
                            labelText: 'Title',
                            suffixIcon: topicController.text.isEmpty
                                ? Container(
                                    width: 2,
                                  )
                                : IconButton(
                                    onPressed: () => topicController.clear(),
                                    icon: const Icon(Icons.close)),
                            border: const OutlineInputBorder(),
                          ),
                          textInputAction: TextInputAction.done,
                        )),
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            topicController.text = value;
                          },
                          itemBuilder: (BuildContext context) {
                            return topicOptions
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem(
                                  child: Text(value), value: value);
                            }).toList();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: situationController,
                      decoration: InputDecoration(
                        hintText: 'e.g Dirt on shoes',
                        labelText: 'Situation',
                        suffixIcon: situationController.text.isEmpty
                            ? Container(
                                width: 2,
                              )
                            : IconButton(
                                onPressed: () => situationController.clear(),
                                icon: const Icon(Icons.close)),
                        border: const OutlineInputBorder(),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        //connectTo();
                        topicOptions.add(topicController.text);
                        moveToQuestionStopper();
                      },
                      child: const Text('Answer Questions'),
                    ),
                    const SizedBox(
                      height: 20,
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
                          "For General Information about Terms",
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
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralInfo()),
                        );
                      },
                      child: _buildImage('assets/json_images/click.json'),
                    ), // put the listbuilder here
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addExposureSave(ExposureEntry exposureSave) {
    setState(() {
      exposureSaves.add(exposureSave);
    });
  }

  void moveToQuestionStopper() async {
    final information = await Navigator.push(
      context,
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) =>
              QuestionPage(situationController.text, topicController.text)),
    );

    topicController.clear();
    situationController.clear();
    if (information != null) {
      _addExposureSave(information);
    }
  }
}
