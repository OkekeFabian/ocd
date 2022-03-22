import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'situation_collector.dart';

class OnboardingScreen1 extends StatelessWidget {
  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  const OnboardingScreen1({Key key}) : super(key: key);

  Widget _buildImage(String assetName) {
    return Align(
      child: Lottie.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SituationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Know your OCD",
          body:
              "This section is to Fill in Situations that cause anxiety and answer questions relating to the exposed situations and it should be filled atleast the first time with a professional",
          image: _buildImage('assets/json_images/therapy.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Situation Steps",
          body:
              "Please Fill in the situation you want to answer the questions about and choose a suitable title to save it with. A total of 5 Situations is to be added to access the 'SELF-MONITORING' section",
          image: _buildImage('assets/json_images/therapy.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Question Area",
          body:
              'Click the button "Answer Questions" to fill in Details about your OCD regarding the situation filled',
          image: _buildImage('assets/json_images/notes.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "General Information Area",
          body: 'Find out General Information about terms related to OCD',
          image: _buildImage('assets/json_images/notes.json'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
