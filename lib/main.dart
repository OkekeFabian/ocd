import 'package:flutter/material.dart';
import 'package:ocd/self_Monitor_pages/situation_class.dart';

import 'Exposures/exposure_data.dart';
import 'first_slider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_onboarding_page.dart';

int isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(WeightEntryAdapter());
  Hive.registerAdapter(ExposureEntryAdapter());

  await Hive.openBox<WeightEntry>('situations');
  await Hive.openBox<ExposureEntry>('exposures');

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('onBoard') ?? false;

  runApp(MyApp(showHome: showHome));
}

/// This is the main application widget.
class MyApp extends StatefulWidget {
  const MyApp({Key key, @required this.showHome}) : super(key: key);

  final bool showHome;
  static const String _title = 'App Sample';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp._title,
      home: widget.showHome ? const MainPageSlider() : const OnboardingScreen(),
    );
  }
}
