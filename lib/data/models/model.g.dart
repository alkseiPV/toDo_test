// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelTaskAdapter extends TypeAdapter<ModelTask> {
  @override
  final int typeId = 0;

  @override
  ModelTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelTask(
      complete: fields[1] as bool,
      task: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelTask obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.task)
      ..writeByte(1)
      ..write(obj.complete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
