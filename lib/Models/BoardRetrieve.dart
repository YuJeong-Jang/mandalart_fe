import 'package:json_annotation/json_annotation.dart';

part 'BoardRetrieve.g.dart';

@JsonSerializable()
class BoardRetrieve {
  int id;
  String title;
  String start_at;
  String end_at;
  int? achievement;
  BoardRetrieve(
    this.id,
    this.title,
    this.start_at,
    this.end_at,
    this.achievement,
  );

  factory BoardRetrieve.fromJson(Map<String, dynamic> json) => _$BoardRetrieveFromJson(json);

  factory BoardRetrieve.fromNamed({
    required int id,
    required String title,
    required String start_at,
    required String end_at,
    int? achievement,
  }) =>
      BoardRetrieve(
        id,
        title,
        start_at,
        end_at,
        achievement,
      );

  Map<String, dynamic> toJson() => _$BoardRetrieveToJson(this);
}
