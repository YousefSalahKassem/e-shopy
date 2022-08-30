// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      User.fromJson(
          UserResponse._readData(json, 'user') as Map<String, dynamic>),
      UserResponse._readData(json, 'token') as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
