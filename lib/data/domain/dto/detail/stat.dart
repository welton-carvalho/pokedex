import 'package:json_annotation/json_annotation.dart';
part 'stat.g.dart';
@JsonSerializable()
class Stat {
  String name;

  Stat(this.name);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}
