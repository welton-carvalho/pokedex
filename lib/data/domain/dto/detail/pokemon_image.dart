
import 'package:json_annotation/json_annotation.dart';
part 'pokemon_image.g.dart';
@JsonSerializable()
class PokemonImage {
  
  @JsonKey(name: "front_default")
  String url;

  PokemonImage(this.url);

  factory PokemonImage.fromJson(Map<String, dynamic> json) => _$PokemonImageFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonImageToJson(this);
}