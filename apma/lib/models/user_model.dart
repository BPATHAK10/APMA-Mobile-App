import 'package:apma/models/medicine_model.dart';
import 'package:apma/models/pain_model.dart';
import 'package:hive/hive.dart';
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

}