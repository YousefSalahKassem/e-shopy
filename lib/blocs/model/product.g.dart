// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as num,
      category: json['category'] as String,
      v: json['__v'] as int,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'category': instance.category,
      '__v': instance.v,
    };
