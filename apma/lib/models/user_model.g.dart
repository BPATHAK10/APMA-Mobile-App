// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..email = fields[0] as String
      ..password = fields[1] as String
      ..name = fields[2] as String
      ..age = fields[4] as String
      ..gender = fields[5] as String
      ..postCode = fields[6] as String
      ..pains = (fields[7] as List).cast<Pain>()
      ..medicines = (fields[8] as List).cast<Medicine>()
      ..foodIllness = (fields[14] as List).cast<String>()
      ..energy = (fields[15] as List).cast<Energy>()
      ..sleep = (fields[16] as List).cast<Sleep>()
      ..movement = (fields[17] as List).cast<Movement>()
      ..food = (fields[18] as List).cast<Food>();
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.postCode)
      ..writeByte(7)
      ..write(obj.pains)
      ..writeByte(8)
      ..write(obj.medicines)
      ..writeByte(14)
      ..write(obj.foodIllness)
      ..writeByte(15)
      ..write(obj.energy)
      ..writeByte(16)
      ..write(obj.sleep)
      ..writeByte(17)
      ..write(obj.movement)
      ..writeByte(18)
      ..write(obj.food);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
