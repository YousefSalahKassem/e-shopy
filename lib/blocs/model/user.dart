import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String email;
  String name;

  User({this.id,required this.email,required this.name});

  User.empty()
      : email = '',
        name = '',
        id = '';

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({String? token, String? id, String? email, String? name}) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}

@JsonSerializable()
class UserResponse {
  @JsonKey(readValue: _readData)
  final User user;
  @JsonKey(readValue: _readData)
  final String token;

  const UserResponse(this.user, this.token);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  static Object? _readData(Map json, String key) {
    final data = json['data'] as Map;
    return data[key];
  }
}
