import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ocd/Exposures/exposure_data.dart';
import 'package:ocd/General%20Information/main_page.dart';
import 'package:ocd/Exposures/question_stepper.dart';
import 'package:ocd/Exposures/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dialog_display.dart';

class SituationPage extends StatefulWidget {
  const SituationPage({
    Key key,
  }) : super(key: key);

  @override
  _SituationPageState createState() => _SituationPageState();
}

class _SituationPageState extends State<SituationPage> {
  @override
  void dispose() {
    Hive.box('exposures').close();
    super.dispose();
  }

  //List<ExposureEntry> exposureSaves = [];
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

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "Situation Area",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ValueListenableBuilder<Box<ExposureEntry>>(
                    valueListenable: Boxes.getExposures().listenable(),
                    builder: (context, box, _) {
                      final situations =
                          box.values.toList().cast<ExposureEntry>();

                      return buildContent(situations);
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
                    children: [
                      Expanded(
                          child: TextField(
                        controller: topicController,
                        decoration: InputDecoration(
                          hintText: 'e.g Dirt',
                          labelText: 'Title',
                          suffixIcon: topicController.text.isEmpty
                              ? Container(
                                  width: 2,
                                )
                              : IconButton(
                                  onPressed: () => topicController.clear(),
                                  icon: const Icon(Icons.clear)),
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
                  TextFormField(
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
                              icon: const Icon(Icons.clear)),
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
                      (topicController.text != '' &&
                              situationController.text != '')
                          ? moveToQuestionStopper()
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please fill in both a Title and Situation')));
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
                            builder: (context) => const GeneralInfo()),
                      );
                    },
                    child: _buildImage('assets/json_images/click.json'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildContent(List<ExposureEntry> transactions) => Column(
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
          (transactions.isEmpty)
              ? const Center(
                  child: Text(
                    'List of Situations will appear here',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemCount: transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final transaction = transactions[index];

                        return buildTransaction(
                            context, transaction, index + 1);
                      },
                    ),
                  ],
                ),
        ],
      );

  Widget buildTransaction(
      BuildContext context, ExposureEntry transaction, int index) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          transaction.title,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(transaction.situation),
        trailing: Text(
          index.toString(),
          style: const TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        children: [
          buildButtons(context, transaction, index),
        ],
      ),
    );
  }

  Widget buildButtons(
          BuildContext context, ExposureEntry transaction, int index) =>
      Row(
        children: [
          Expanded(
            child: TextButton.icon(
              label: const Text('View'),
              icon: const Icon(Icons.remove_red_eye_rounded),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SituationDetailPage(
                    exposureEntry: transaction,
                    index: index,
                  ),
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
                      content: Text('A situation has been deleted')));
                }),
          )
        ],
      );

  Future _addExposureSave(ExposureEntry exposureSave) async {
    final box = Boxes.getExposures();
    box.add(exposureSave);
  }

  void deleteTransaction(ExposureEntry transaction) {
    // final box = Boxes.getTransactions();
    // box.delete(transaction.key);

    transaction.delete();

    //setState(() => transactions.remove(transaction));
  }

  void moveToQuestionStopper() async {
    topicOptions.add(topicController.text);
    final information = await Navigator.push(
      context,
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => QuestionPage(
              situation: situationController.text,
              title: topicController.text)),
    );

    topicController.clear();
    situationController.clear();
    if (information != null) {
      _addExposureSave(information);
    }
  }
}
