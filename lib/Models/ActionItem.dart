import 'package:json_annotation/json_annotation.dart';

part 'ActionItem.g.dart';

@JsonSerializable()
class ActionItem {
  int id;
  String title;
  int mission_id;
  String cycle;
  int goal_unit;
  int action_unit;
  String unit_name;
  int? achievement;

  ActionItem(
      this.id,
      this.title,
      this.mission_id,
      this.cycle,
      this.goal_unit,
      this.action_unit,
      this.unit_name,
      this.achievement);

  factory ActionItem.fromJson(Map<String, dynamic> json) => _$ActionItemFromJson(json);

  factory ActionItem.fromNamed({
    required int id,
    required String title,
    required int mission_id,
    required String cycle,
    required int goal_unit,
    required int action_unit,
    required String unit_name,
    int? achievement,
  }) =>
      ActionItem(
        id,
        title,
        mission_id,
        cycle,
        goal_unit,
        action_unit,
        unit_name,
        achievement
      );

  Map<String, dynamic> toJson() => _$ActionItemToJson(this);
}
