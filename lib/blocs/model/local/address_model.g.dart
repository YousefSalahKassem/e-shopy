// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      country: json['country'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      postcode: json['postcode'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'street': instance.street,
      'postcode': instance.postcode,
    };
