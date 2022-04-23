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

    @HiveField(3)
    late String contactNumber;

    @HiveField(4)
    late String age;

    @HiveField(5)
    late String gender;

    @HiveField(6)
    late String postCode;

    @HiveField(7) 
    HiveList? pains;

    @HiveField(8)
    HiveList? medicines;

}