// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      title: fields[1] as String,
      description: fields[2] as String,
      dateStart: fields[3] as DateTime,
      dateEnd: fields[4] as DateTime,
      statusCompleet: fields[5] as String?,
      compleet: fields[6] as bool?,
      price: fields[7] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.dateStart)
      ..writeByte(4)
      ..write(obj.dateEnd)
      ..writeByte(5)
      ..write(obj.statusCompleet)
      ..writeByte(6)
      ..write(obj.compleet)
      ..writeByte(7)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
