import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? name;
  final DateTime? birthday;

  User(this.id, this.name, this.birthday);

  factory User.fromJson(dynamic json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}