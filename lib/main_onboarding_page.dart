import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'first_slider.dart';

class OnboardingScreen extends StatelessWidget {
  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  const OnboardingScreen({Key key}) : super(key: key);

  Widget _buildImage(String assetName) {
    return Align(
      child: Lottie.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) async {
    //_storeOnBoardInfo();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onBoard', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPageSlider()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Know your OCD & Self-Monitoring",
          body:
              "The app Comprises of Two sections and both should be filled with a professional.\nKNOW YOUR OCD: Contains situations that cause anxiety with information relating to them.\nSELF-MONITORING: It is very important for the treatment program that the Professional has an accurate picture of your obsessive thinking and compulsive behavior.",
          image: _buildImage('assets/json_images/therapy.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Know your OCD: Situation Steps",
          body:
              "Please fill in the situation you want to answer the questions about and choose a suitable title to save it with. A total of 5 Situations is to be added before moving to the 'SELF-MONITORING' section.",
          image: _buildImage('assets/json_images/therapy.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Know your OCD: Question Area",
          body:
              'Click the button "Answer Questions" to fill in Details about your OCD regarding the situation filled.',
          image: _buildImage('assets/json_images/notes.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Know your OCD: General Information Area",
          body: 'Find out General Information about terms related to OCD.',
          image: _buildImage('assets/json_images/notes.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Self-Monitoring: How to Use",
          body:
              "The Self Monitoring is to be filled after you experience your obsession by answering all questions after every obsession.",
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
