import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'first_main_page.dart';

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

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const FirstMainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Self Monitoring",
          body:
              "It is recommended to go over this area with a Professional as it is very important for the treatment program that the Professional has an accurate picture of your obsessive thinking and compulsive behavior",
          image: _buildImage('assets/json_images/therapy.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "How to Use",
          body:
              "The Self Monitoring is to be filled after you experience your obsession by answering all questions after every obsession",
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
