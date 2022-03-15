import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lottie/lottie.dart';
import 'package:ocd/Exposures/situation_collector.dart';
import 'package:ocd/General%20Information/main_page.dart';

import 'exposure_data.dart';

class QuestionPage extends StatefulWidget {
  String situation;
  String title;

  QuestionPage(this.situation, this.title);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  final externalController = TextEditingController();
  final thoughtController = TextEditingController();
  final mentalRitualController = TextEditingController();

  final disgustController = TextEditingController();
  final avoidanceController = TextEditingController();
  final ritualController = TextEditingController();

  bool formFilled = false;

  /*  @override
  void initState() {
    super.initState();
    externalController = TextEditingController(text: _obsession);
    thoughtController = TextEditingController(text: _thought);
    disgustController = TextEditingController(text: _disgust);
    avoidanceController = TextEditingController(text: _avoidance);
    ritualController = TextEditingController(text: _ritual);
    mentalRitualController = TextEditingController(text: _mental);
    _situation = widget.situation;
    _title = widget.title;
  } */

/*   @override
  void dispose() {
    externalController.dispose();
    thoughtController.dispose();
    disgustController.dispose();
    avoidanceController.dispose();
    ritualController.dispose();
    mentalRitualController.dispose();

    super.dispose();
  }
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Questions '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: KeyboardDismisser(
              gestures: const [GestureType.onTap],
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                controlsBuilder:
                    (BuildContext context, ControlsDetails controls) {
                  final isLastStep = _currentStep == 6;
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          child: Text(isLastStep ? 'Save' : 'Next'),
                          onPressed: controls.onStepContinue,
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        if (_currentStep != 0)
                          Expanded(
                              child: ElevatedButton(
                            child: Text('Back'),
                            onPressed: controls.onStepCancel,
                          )),
                      ],
                    ),
                  );
                },
                steps: <Step>[
                  Step(
                    title: const Text(
                        'Obsession trigger - Objects/situations which are sources of high anxiety/discomfort'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: externalController,
                          decoration: const InputDecoration(
                              labelText: 'e.g Touching a door handle'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text(
                        'Thoughts - What thoughts are evoked by this trigger'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: thoughtController,
                          decoration: const InputDecoration(
                              labelText:
                                  'e.g I could inadvertently spread some horrible disease'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text(
                        'Disgust - Write out situations that cause disgust '),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: disgustController,
                          decoration: const InputDecoration(
                              labelText: 'e.g Seeing an oil stain'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text(
                        'Avoidance Behavior - Specify situations that you avoid to cope with your anxiety'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: avoidanceController,
                          decoration: const InputDecoration(
                              labelText: 'e.g I do not use public toilet'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text(
                        'Rituals - Specify rituals you usually perform'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: ritualController,
                          decoration: const InputDecoration(
                              labelText: 'e.g Washing your hands'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 4
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text(
                        'Mental Rituals - Specify Mental rituals you usually perform'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: mentalRitualController,
                          decoration: const InputDecoration(
                              labelText: 'e.g Special prayers'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 5
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: const Text('Completed'),
                    content: Text('Thank you! Click Submit to view your List'),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 6
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: ('Click for more info about Terms: '),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GeneralInfo()),
            );
          },
          child: const FloatingActionButton(
            child: Icon(Icons.announcement),

            //onPressed: switchStepsType,
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep == 6) {
      Navigator.of(context).pop(ExposureEntry(
          widget.title,
          widget.situation,
          externalController.text,
          thoughtController.text,
          disgustController.text,
          avoidanceController.text,
          ritualController.text,
          mentalRitualController.text));

      setState(() => formFilled = true);
    } else {
      setState(() => _currentStep += 1);
    }
  }

  cancel() {
    setState(() => _currentStep -= 1);
  }
}
