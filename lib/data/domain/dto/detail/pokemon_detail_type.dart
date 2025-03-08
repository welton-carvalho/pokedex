import 'package:json_annotation/json_annotation.dart';
part 'pokemon_detail_type.g.dart';

@JsonSerializable()
class PokemonDetailType {
  String name;

  PokemonDetailType(this.name);

  factory PokemonDetailType.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailTypeToJson(this);
}
