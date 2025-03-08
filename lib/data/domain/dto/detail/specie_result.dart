import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/data/domain/dto/detail/specie_description.dart';

part 'specie_result.g.dart';

@JsonSerializable(explicitToJson: true)
class SpecieResult {

  @JsonKey(name: "flavor_text_entries")
  final List<SpecieDescription?>? descriptions;
  SpecieResult(this.descriptions);

  factory SpecieResult.fromJson(Map<String, dynamic> json) => _$SpecieResultFromJson(json);
  Map<String, dynamic> toJson() => _$SpecieResultToJson(this);
}