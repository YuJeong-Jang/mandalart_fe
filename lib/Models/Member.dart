import 'package:json_annotation/json_annotation.dart';

part 'Member.g.dart';

@JsonSerializable()
class Member {
  String document_id;
  String name;
  String email;
  String? token;
  String? pwd;
  int? pwd_mod_dt;
  int? reg_dt;
  int? mod_dt;
  Member(this.document_id, this.name, this.email, this.token, this.pwd,
      this.pwd_mod_dt, this.reg_dt, this.mod_dt);

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  factory Member.fromNamed(
          {required String document_id,
          required String name,
          required String email,
          String? token,
          String? pwd,
          int? pwd_mod_dt,
          int? reg_dt,
          int? mod_dt}) =>
      Member(document_id, name, email, token, pwd, pwd_mod_dt, reg_dt, mod_dt);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
