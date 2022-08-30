import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final String details;
  final String imageUrl;
  final num price;
  final String category;
  final int v;

  Product({
    required this.id,
    required this.name,
    required this.details,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    String? id,
    String? name,
    String? details,
    String? imageUrl,
    num? price,
    String? category,
    int? v,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      details: details ?? this.details,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      v: v ?? this.v,
    );
  }
}
