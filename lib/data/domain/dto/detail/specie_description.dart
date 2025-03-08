import 'package:json_annotation/json_annotation.dart';

part 'specie_description.g.dart';

@JsonSerializable()
class SpecieDescription {

  @JsonKey(name: "flavor_text")
  final String description;
  SpecieDescription(this.description);

  factory SpecieDescription.fromJson(Map<String, dynamic> json) => _$SpecieDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SpecieDescriptionToJson(this);
}