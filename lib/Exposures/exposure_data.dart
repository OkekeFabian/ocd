import 'package:hive/hive.dart';

part 'exposure_data.g.dart';

@HiveType(typeId: 1)
class ExposureEntry extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String situation;
  @HiveField(2)
  String obsession;
  @HiveField(3)
  String thought;
  @HiveField(4)
  String disgust;
  @HiveField(5)
  String avoidance;
  @HiveField(6)
  String ritual;
  @HiveField(7)
  String mental;

  ExposureEntry(this.title, this.situation, this.obsession, this.thought,
      this.disgust, this.avoidance, this.ritual, this.mental);
}
