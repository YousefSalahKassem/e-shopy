import 'package:json_annotation/json_annotation.dart';
part 'sample_serializable_model.g.dart';

@JsonSerializable()
class SampleSerializableModel {
  String? name;
  int? age;

  SampleSerializableModel({this.name, this.age});

  factory SampleSerializableModel.fromJson(Map<String, dynamic> json) =>
      _$SampleSerializableModelFromJson(json);

  Map<String, dynamic> toJson() => _$SampleSerializableModelToJson(this);
}
