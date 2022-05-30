import 'package:apma/models/energy_model.dart';
import 'package:apma/models/medicine_model.dart';
import 'package:apma/models/movement_model.dart';
import 'package:apma/models/pain_model.dart';
import 'package:apma/models/sleep_model.dart';
import 'package:hive/hive.dart';

import 'food_model.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
    @HiveField(0)
    late String email;

    @HiveField(1)
    late String password;

    @HiveField(2)
    late String name;

    @HiveField(4)
    late String age;

    @HiveField(5)
    late String gender;

    @HiveField(6)
    late String postCode;

    @HiveField(7) 
    List<Pain> pains= [];

    @HiveField(8)
    List<Medicine> medicines=[];

    @HiveField(14)
    List<String> foodIllness = [];
    
    @HiveField(15)
    List<Energy> energy=[];

    @HiveField(16)
    List<Sleep> sleep=[];

    @HiveField(17)
    List<Movement> movement=[];

    @HiveField(18)
    List<Food> food=[];

}