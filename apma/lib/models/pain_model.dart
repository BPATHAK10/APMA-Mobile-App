import 'package:hive/hive.dart';

part 'pain_model.g.dart';

@HiveType(typeId: 1)
class Pain extends HiveObject {
  @HiveField(0)
  late DateTime date;

  @HiveField(1)
  late String type;

  @HiveField(2)
  late double intensity;

  @HiveField(3)
  late bool hasMedication; 
}