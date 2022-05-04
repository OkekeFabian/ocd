import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ocd/self_Monitor_pages/situation_class.dart';

class Boxes {
  static Box<WeightEntry> getSituations() =>
      Hive.box<WeightEntry>('situations');
}
