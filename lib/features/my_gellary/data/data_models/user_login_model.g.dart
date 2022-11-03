// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLoginModelAdapter extends TypeAdapter<UserLoginModel> {
  @override
  final int typeId = 0;

  @override
  UserLoginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLoginModel(
      userDataModel: fields[0] as UserDataModel?,
      token: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLoginModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userDataModel)
      ..writeByte(1)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
