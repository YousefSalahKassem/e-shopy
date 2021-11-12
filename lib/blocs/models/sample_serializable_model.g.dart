// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_serializable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleSerializableModel _$SampleSerializableModelFromJson(
  Map<String, dynamic> json,
) =>
    SampleSerializableModel(
      name: json['name'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$SampleSerializableModelToJson(
  SampleSerializableModel instance,
) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
    };
