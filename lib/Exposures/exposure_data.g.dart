// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exposure_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExposureEntryAdapter extends TypeAdapter<ExposureEntry> {
  @override
  final int typeId = 1;

  @override
  ExposureEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExposureEntry(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExposureEntry obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.situation)
      ..writeByte(2)
      ..write(obj.obsession)
      ..writeByte(3)
      ..write(obj.thought)
      ..writeByte(4)
      ..write(obj.disgust)
      ..writeByte(5)
      ..write(obj.avoidance)
      ..writeByte(6)
      ..write(obj.ritual)
      ..writeByte(7)
      ..write(obj.mental);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExposureEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
