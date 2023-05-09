// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LawyerAdapter extends TypeAdapter<Lawyer> {
  @override
  final int typeId = 0;

  @override
  Lawyer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lawyer(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      (fields[11] as List).cast<dynamic>(),
      (fields[12] as List).cast<dynamic>(),
      fields[13] as String,
      fields[14] as String,
      fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Lawyer obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.fieldOfExpertise)
      ..writeByte(6)
      ..write(obj.bio)
      ..writeByte(7)
      ..write(obj.level)
      ..writeByte(8)
      ..write(obj.hoursLogged)
      ..writeByte(9)
      ..write(obj.phoneNo)
      ..writeByte(10)
      ..write(obj.email)
      ..writeByte(11)
      ..write(obj.areasOfPractise)
      ..writeByte(12)
      ..write(obj.serviceOffered)
      ..writeByte(13)
      ..write(obj.profilePicture)
      ..writeByte(14)
      ..write(obj.rating)
      ..writeByte(15)
      ..write(obj.ranking);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LawyerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
