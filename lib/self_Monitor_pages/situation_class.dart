import 'package:hive/hive.dart';

part 'situation_class.g.dart';

@HiveType(typeId: 0)
class WeightEntry extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  int rating;

  @HiveField(2)
  String experience;

  @HiveField(3)
  String response;

  @HiveField(4)
  String result;


}
