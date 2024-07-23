import 'package:json_annotation/json_annotation.dart';

part 'Mission.g.dart';

@JsonSerializable()
class Mission {
  int id;
  String title;
  String board_id;
  Mission(
    this.id,
    this.title,
    this.board_id,
  );

  factory Mission.fromJson(Map<String, dynamic> json) => _$MissionFromJson(json);

  factory Mission.fromNamed({
    required int id,
    required String title,
    required String board_id,
  }) =>
      Mission(
        id,
        title,
        board_id,
      );

  Map<String, dynamic> toJson() => _$MissionToJson(this);
}
