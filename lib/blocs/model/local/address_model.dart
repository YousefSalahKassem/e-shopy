import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';
@JsonSerializable()
class AddressModel {
  final String country;
  final String city;
  final String street;
  final String postcode;

  AddressModel({
    required this.country,
    required this.city,
    required this.street,
    required this.postcode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}