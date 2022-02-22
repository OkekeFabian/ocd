import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'count_down_timer.dart';
import 'package:get/get.dart';

class ByGetXStateManagement extends StatefulWidget {
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
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: KeyboardDismisser(
        gestures: [ GestureType.onTap,],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('Set a countdown Timer', style: TextStyle(fontWeight: FontWeight.bold ),),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    SizedBox(
                        height: 40,
                        width: 50,
                        child: TextField(
                          controller: _textEditingController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)))),
                        )),
                    GetBuilder<CountDownTimerState>(
                        builder: (_) => Text('${TimerState.SCount}')),
                  ]
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [

                    ElevatedButton(
                        onPressed: () {
                          TimerState.StateTimerStart();

                        },
                        child: Text('Start Timer')),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        TimerState.Pause();
                      },
                      child: Text('Pause'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        TimerState.reset();
                      },
                      child: Text('Reset'),
                    ),
                  ]
              ),

            ],
          ),
        ),

      ),

    );
  }
}