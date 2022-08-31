import 'package:json_annotation/json_annotation.dart';
part 'cart_model.g.dart';


@JsonSerializable()
class CartModel {
  int quantity;
  final String  id;

  CartModel({
    required this.quantity,
    required this.id,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

}
