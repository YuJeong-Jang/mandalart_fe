import 'package:json_annotation/json_annotation.dart';

part 'Board.g.dart';

@JsonSerializable()
class Board {
  int id;
  DateTime created;
  DateTime modified;
  DateTime deleted;
  String title;
  int achievement;
  String start_at;
  String end_at;
  int? daily_goal;
  double? total_percentage;
  Board(
      this.id,
      this.created,
      this.modified,
      this.deleted,
      this.title,
      this.achievement,
      this.start_at,
      this.end_at,
      this.daily_goal,
      this.total_percentage);

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  factory Board.fromNamed(
          {required int id,
          required DateTime created,
          required DateTime modified,
          required DateTime deleted,
          required String title,
          required int achievement,
          required String start_at,
          required String end_at,
          int? daily_goal,
          double? total_percentage}) =>
      Board(id, created, modified, deleted, title, achievement, start_at,
          end_at, daily_goal, total_percentage);

  Map<String, dynamic> toJson() => _$BoardToJson(this);
}
