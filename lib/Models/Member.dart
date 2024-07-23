import 'package:json_annotation/json_annotation.dart';

part 'Member.g.dart';

@JsonSerializable()
class Member {
  int pk;
  String username;
  String email;
  String? first_name;
  String? last_name;
  String? token;
  String? password1;
  String? password2;
  Member(
    this.pk,
    this.username,
    this.email,
    this.first_name,
    this.last_name,
    this.token,
    this.password1,
    this.password2,
  );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  factory Member.fromNamed({
    required int pk,
    required String username,
    required String email,
    String? first_name,
    String? last_name,
    String? token,
    String? password1,
    String? password2,
  }) =>
      Member(
        pk,
        username,
        email,
        first_name,
        last_name,
        token,
        password1,
        password2
      );

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
