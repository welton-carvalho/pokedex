import 'package:json_annotation/json_annotation.dart';
import 'pokemon_detail_type.dart';

part 'pokemon_type.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonType {
  @JsonKey(name: "slot")
  int order;

  PokemonDetailType type;

  PokemonType(this.order, this.type);

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
