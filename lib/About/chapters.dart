import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../first_slider.dart';

class ChapterInfo extends StatelessWidget {
  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );
  const ChapterInfo({Key key}) : super(key: key);

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildImageLottie(String assetName) {
    return Align(
      child: Lottie.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPageSlider()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Know your OCD & Self-Monitoring Section",
          body:
              "The app Comprises of Two sections and both should be filled with a professional.\nKNOW YOUR OCD: Contains situations that cause anxiety with information relating to them.\nSELF-MONITORING: It is very important for the treatment program that the Professional has an accurate picture of your obsessive thinking and compulsive behavior.",
          image: _buildImageLottie('assets/json_images/therapy.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Know your OCD: Situation Steps",
          body:
              "Please Fill in the situation you want to answer the questions about and choose a suitable title to save it with. Then proceed to answer the relevant questions. A total of 5 Situations is to be added before moving to the 'SELF-MONITORING' section.",
          image: _buildImage('assets/extra_images/Situation_steps.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Know your OCD: General Information Area",
          body: 'Find out General Information about terms related to OCD.',
          image: _buildImage('assets/extra_images/gen_info.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Self-Monitoring: How to Use",
          body:
              "The Self Monitoring is to be filled after you experience your obsession by answering all questions after every obsession.",
          image: _buildImageLottie('assets/json_images/notes.json'),
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
