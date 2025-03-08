import 'package:json_annotation/json_annotation.dart';
import 'stat.dart';
part 'base_stat.g.dart';
@JsonSerializable(explicitToJson: true)
class BaseStat {
  @JsonKey(name: 'base_stat')
  int baseStat;

  Stat stat;

  BaseStat(this.baseStat, this.stat);

  factory BaseStat.fromJson(Map<String, dynamic> json) => _$BaseStatFromJson(json);

  Map<String, dynamic> toJson() => _$BaseStatToJson(this);
}
