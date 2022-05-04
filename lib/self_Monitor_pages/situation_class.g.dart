// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'situation_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeightEntryAdapter extends TypeAdapter<WeightEntry> {
  @override
  final int typeId = 0;

  @override
  WeightEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeightEntry()
      ..dateTime = fields[0] as DateTime
      ..rating = fields[1] as int
      ..experience = fields[2] as String
      ..response = fields[3] as String
      ..result = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, WeightEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.rating)
      ..writeByte(2)
      ..write(obj.experience)
      ..writeByte(3)
      ..write(obj.response)
      ..writeByte(4)
      ..write(obj.result);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
