import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/data/domain/dto/detail/species.dart';
import 'base_stat.dart';
import 'pokemon_type.dart';
import 'sprites.dart';
part 'pokemon_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class Pokemon {
  int height;
  String name;
  int id;
  int weight;
  List<BaseStat> stats;
  Sprites sprites;
  List<PokemonType> types;
  Species species;
  String? description;

  Pokemon(
    this.height,
    this.name,
    this.id,
    this.weight,
    this.stats,
    this.sprites,
    this.types,
    this.species,
    this.description,
  );

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
