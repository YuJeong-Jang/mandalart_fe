import 'package:json_annotation/json_annotation.dart';

part 'Board.g.dart';

@JsonSerializable()
class Board {
  int id;
  String created;
  String modified;
  String? deleted;
  String title;
  int? achievement;
  String start_at;
  String end_at;
  Board(
    this.id,
    this.created,
    this.modified,
    this.deleted,
    this.title,
    this.achievement,
    this.start_at,
    this.end_at,
  );

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  factory Board.fromNamed({
    required int id,
    required String created,
    required String modified,
    String? deleted,
    required String title,
    int? achievement,
    required String start_at,
    required String end_at,
  }) =>
      Board(
        id,
        created,
        modified,
        deleted,
        title,
        achievement,
        start_at,
        end_at
      );

  Map<String, dynamic> toJson() => _$BoardToJson(this);
}
