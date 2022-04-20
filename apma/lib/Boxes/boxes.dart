import 'package:hive/hive.dart';
import 'package:apma/models/mediacation_model.dart';
import 'package:apma/models/pain_model.dart';
import 'package:apma/models/user_model.dart';

class Boxes {
  static Box<User> getUsers() => 
    Hive.box<User>('users');

  static Box<Pain> getPains() =>
    Hive.box<Pain>('pains');

  static Box<Medication> getMedications() =>
    Hive.box<Medication>('medications');
}