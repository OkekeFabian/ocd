import 'package:flutter/material.dart';
import 'package:ocd/Interventions/First_Intervention/video_player.dart';
import 'package:ocd/Interventions/First_Intervention/get_state_management.dart';

class FirstInterventionAct extends StatefulWidget {
  const FirstInterventionAct({Key key}) : super(key: key);

  @override
  State<FirstInterventionAct> createState() => _FirstInterventionActState();

}

double _startValue = 1.0;
double _endValue = 10.0;


class _FirstInterventionActState extends State<FirstInterventionAct> {

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          children:<Widget> [
            Card(
              color: Colors.yellowAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  const Text(
                      'Who and what is essential to your life?'
                          "What thoughts and feelings make it difficult to build these habits"
                          "What do you do to control push away or get rid of this distress "
                          "What costs have you suffered as a result of these coping strategies"
                          "How well do they work");
                },
                child: const SizedBox(
                  width: 100,
                  height: 60,
                  child: Text('Creative Hopelessness Exercise'
                      //"The problem isnt the problem, its the solution that is the problem"
                    ),
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [Card(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
               ),
                child: InkWell(
                  highlightColor: Colors.blueGrey,
                  radius: 6,
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Text("Metaphor");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AsserPlayerWidget()),
                    );
                  },
                  child: const SizedBox(
                      width: 100,
                      height: 70,

                      child: Center(
                        child: Text('First Metaphor'),
                      )
                  ),
                ),
              ),
                Card(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: const SizedBox(
                        width: 100,
                        height: 70,

                        child: Center(
                          child: Text('Second Metaphor'),
                        )
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text: 'Touching Door Knob', style: TextStyle(fontWeight: FontWeight.bold)),

                ],
              ),
            ),

            ByGetXStateManagement(),
            const SizedBox(height: 12,),
            Text("Rate Willingness"),
            RangeSlider(

              min: 0.0,
              max: 100.0,
              divisions: 10,
              labels: RangeLabels(
                _startValue.round().toString(),
                _endValue.round().toString(),
              ),
              values: RangeValues(_startValue, _endValue),
              onChanged: (values) {

                setState(() {
                  _startValue = values.start;
                  _endValue = values.end;
                });
              },
            )
          ],

        ),


      ) ,
    )
    ;
  }
}
