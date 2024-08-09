import 'package:json_annotation/json_annotation.dart';
import 'package:make_me_better_mandalart_fe/Models/Mission.dart';

part 'Board.g.dart';

@JsonSerializable()
class Board {
  String? document_id;
  int? reg_dt;
  int? mod_dt;
  int? del_dt;
  bool? del_yn;
  String boardNm;
  String start_at;
  String end_at;
  int? daily_goal;
  double? total_percentage;
  Mission? missions;
  Board(
      this.document_id,
      this.reg_dt,
      this.mod_dt,
      this.del_dt,
      this.del_yn,
      this.boardNm,
      this.start_at,
      this.end_at,
      this.daily_goal,
      this.total_percentage,
      this.missions);

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  factory Board.fromNamed(
          {required String document_id,
          int? reg_dt,
          int? mod_dt,
          int? del_dt,
          bool? del_yn,
          required String boardNm,
          required String start_at,
          required String end_at,
          int? daily_goal,
          double? total_percentage,
          missions}) =>
      Board(document_id, reg_dt, mod_dt, del_dt, del_yn, boardNm, start_at,
          end_at, daily_goal, total_percentage, missions);

  Map<String, dynamic> toJson() => _$BoardToJson(this);
}
