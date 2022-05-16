import 'package:flutter/material.dart';
import 'count_down_timer.dart';
import 'package:get/get.dart';

class ByGetXStateManagement extends StatefulWidget {
  const ByGetXStateManagement({Key key}) : super(key: key);

  @override
  _ByGetXStateManagementState createState() => _ByGetXStateManagementState();
}

class _ByGetXStateManagementState extends State<ByGetXStateManagement> {
  final CountDownTimerState TimerState = Get.put(CountDownTimerState());

  final _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController
        .addListener(() => TimerState.setnumber(_textEditingController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Set a countdown Timer',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                    height: 40,
                    width: 50,
                    child: TextField(
                      controller: _textEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    )),
                GetBuilder<CountDownTimerState>(
                    builder: (_) => Text('${TimerState.SCount}')),
              ]),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    onPressed: () {
                      TimerState.StateTimerStart();
                    },
                    child: const Text('Start Timer')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    TimerState.Pause();
                  },
                  child: const Text('Pause'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    TimerState.reset();
                  },
                  child: const Text('Reset'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
