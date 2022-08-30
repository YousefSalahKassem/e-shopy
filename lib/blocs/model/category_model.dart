import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String id;
  final String category;
  final int v;

  const Category({
    required this.id,
    required this.category,
    required this.v,
  });

  Category.empty()
      : id = '',
        category = '',
        v = 0;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    String? id,
    String? category,
    int? v,
  }) {
    return Category(
      id: id ?? this.id,
      category: category ?? this.category,
      v: v ?? this.v,
    );
  }
}

List<IconData> listIcons = [
  FontAwesomeIcons.shop,
  Icons.phone_iphone,
  FontAwesomeIcons.shoePrints,
  FontAwesomeIcons.shirt,
  Icons.laptop_mac,
  FontAwesomeIcons.camera,
  Icons.shopping_bag,
  FontAwesomeIcons.bicycle,
  Icons.watch,
  Icons.toys_outlined,
  Icons.menu_book_sharp,
  Icons.bed_rounded,
  Icons.chair_rounded
];
