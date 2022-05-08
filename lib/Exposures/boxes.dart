import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ocd/self_Monitor_pages/situation_class.dart';

import 'exposure_data.dart';

class Boxes {
  static Box<ExposureEntry> getExposures() =>
      Hive.box<ExposureEntry>('exposures');
}
