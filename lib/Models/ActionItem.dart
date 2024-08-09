import 'package:json_annotation/json_annotation.dart';

part 'ActionItem.g.dart';

@JsonSerializable()
class ActionItem {
  String document_id;
  String action_name;
  String mission_doc_id;
  String board_doc_id;
  String cycle;
  int goal_unit;
  int action_unit;
  String unit;
  int? achievement;

  ActionItem(
      this.document_id,
      this.action_name,
      this.mission_doc_id,
      this.board_doc_id,
      this.cycle,
      this.goal_unit,
      this.action_unit,
      this.unit,
      this.achievement);

  factory ActionItem.fromJson(Map<String, dynamic> json) =>
      _$ActionItemFromJson(json);

  factory ActionItem.fromNamed({
    required String document_id,
    required String action_name,
    required String mission_doc_id,
    required String board_doc_id,
    required String cycle,
    required int goal_unit,
    required int action_unit,
    required String unit,
    int? achievement,
  }) =>
      ActionItem(document_id, action_name, mission_doc_id, board_doc_id, cycle,
          goal_unit, action_unit, unit, achievement);

  Map<String, dynamic> toJson() => _$ActionItemToJson(this);
}
