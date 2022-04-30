import 'package:hive/hive.dart';
import 'package:apma/models/user_model.dart';

class Boxes {
  static Box<User> getUsers() => 
    Hive.box<User>('users');
}