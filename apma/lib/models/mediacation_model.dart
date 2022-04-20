import 'package:hive/hive.dart';

part 'mediacation_model.g.dart';

@HiveType(typeId: 2)
class Medication extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late double dosage;

  @HiveField(2)
  late int frequency;

  @HiveField(3)
  late DateTime expiryDate;
}