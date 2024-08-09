import 'package:json_annotation/json_annotation.dart';
import 'package:make_me_better_mandalart_fe/Models/ActionItem.dart';

part 'Mission.g.dart';

@JsonSerializable()
class Mission {
  String document_id;
  String mission_name;
  String board_id;
  int? reg_dt;
  int? mod_dt;
  int? del_dt;
  bool? del_yn;
  ActionItem? actions;

  Mission(this.document_id, this.mission_name, this.board_id, this.reg_dt,
      this.mod_dt, this.del_dt, this.del_yn, this.actions);

  factory Mission.fromJson(Map<String, dynamic> json) =>
      _$MissionFromJson(json);

  factory Mission.fromNamed(
          {required String document_id,
          required String mission_name,
          required String board_id,
          int? reg_dt,
          int? mod_dt,
          int? del_dt,
          bool? del_yn,
          ActionItem? actions}) =>
      Mission(document_id, mission_name, board_id, reg_dt, mod_dt, del_dt,
          del_yn, actions);

  Map<String, dynamic> toJson() => _$MissionToJson(this);
}
