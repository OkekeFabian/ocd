import 'package:flutter/material.dart';

class FirstInterventionErp extends StatefulWidget {
  const FirstInterventionErp({Key key}) : super(key: key);

  @override
  State<FirstInterventionErp> createState() => _FirstInterventionErpState();
}

double _startValue = 1.0;
double _endValue = 10.0;

class _FirstInterventionErpState extends State<FirstInterventionErp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'Graph or Data on Exposures',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
