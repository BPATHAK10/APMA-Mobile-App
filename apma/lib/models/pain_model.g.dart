// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pain_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PainAdapter extends TypeAdapter<Pain> {
  @override
  final int typeId = 1;

  @override
  Pain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pain()
      ..date = fields[0] as DateTime
      ..type = fields[1] as String
      ..intensity = fields[2] as double
      ..hasMedication = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Pain obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.intensity)
      ..writeByte(3)
      ..write(obj.hasMedication);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
