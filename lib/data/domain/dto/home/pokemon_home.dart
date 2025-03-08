import 'package:json_annotation/json_annotation.dart';

part 'pokemon_home.g.dart';

@JsonSerializable()
class PokemonHome {

  String name;
  String url;

  PokemonHome(this.name, this.url);

  factory PokemonHome.fromJson(Map<String,dynamic> json) => _$PokemonHomeFromJson(json);

  Map<String,dynamic> toJson() => _$PokemonHomeToJson(this);
}