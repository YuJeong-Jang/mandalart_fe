import 'package:json_annotation/json_annotation.dart';

part 'MissionRetrieve.g.dart';

@JsonSerializable()
class MissionRetrieve {
  int id;
  String title;
  MissionRetrieve(
    this.id,
    this.title,
  );

  factory MissionRetrieve.fromJson(Map<String, dynamic> json) => _$MissionRetrieveFromJson(json);

  factory MissionRetrieve.fromNamed({
    required int id,
    required String title,
    int? achievement,
  }) =>
      MissionRetrieve(
        id,
        title,
      );

  Map<String, dynamic> toJson() => _$MissionRetrieveToJson(this);
}
