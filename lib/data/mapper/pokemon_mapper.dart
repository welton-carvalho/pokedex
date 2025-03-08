import 'package:pokemon/data/domain/dto/detail/pokemon_detail.dart';
import 'package:pokemon/data/domain/vo/detail/pokemon_stat_vo.dart';
import 'package:pokemon/data/domain/vo/detail/pokemon_type_vo.dart';
import 'package:pokemon/data/domain/vo/detail/pokemon_vo.dart';
import 'package:pokemon/design_system/colors.dart';

class PokemonMapper {
  PokemonMapper._();

  static List<PokemonVo> mapper(List<Pokemon> pokemonsDto) {
    final pokemonsVo = pokemonsDto.map((pokemon) {
      final stats = pokemon.stats.map((s) {
        final name = switch (s.stat.name) {
          'hp' => 'HP',
          'attack' => 'ATK',
          'defense' => 'DEF',
          'special-attack' => 'SATK',
          'special-defense' => 'SDEF',
          'speed' => 'SPD',
          _ => ''
        };
        final progressValue = s.baseStat / 100;

        return PokemonStatsVo(
          name: name,
          value: s.baseStat.toString().padLeft(3, '0'),
          progressValue: progressValue,
        );
      }).toList();

      final types = pokemon.types.map((t) {
        return PokemonTypeVo(
            name: t.type.name.capitalizeFirstLetter(),
            order: t.order.toString());
      }).toList();

      final pokemonColor = switch (types[0].name.toLowerCase()) {
        "bug" => PokemonColors.bug,
        "dark" => PokemonColors.dark,
        "dragon" => PokemonColors.dragon,
        "electric" => PokemonColors.electric,
        "fairy" => PokemonColors.fairy,
        "fighting" => PokemonColors.fighting,
        "fire" => PokemonColors.fire,
        "flying" => PokemonColors.flying,
        "ghost" => PokemonColors.ghost,
        "normal" => PokemonColors.normal,
        "grass" => PokemonColors.grass,
        "ice" => PokemonColors.ice,
        "poison" => PokemonColors.poison,
        "psychic" => PokemonColors.psychic,
        "rock" => PokemonColors.rock,
        "steel" => PokemonColors.steel,
        "water" => PokemonColors.water,
        _ => PokemonColors.grass
      };
      final descriptionNormalized =
          pokemon.description?.replaceAll("\n", " ").replaceAll("\f", "") ?? "";
      return PokemonVo(
          height: "${pokemon.height / 10} m",
          weight: "${pokemon.weight / 10} kg",
          image: pokemon.sprites.other.image.url,
          name: pokemon.name.capitalizeFirstLetter(),
          number: pokemon.id.toString().padLeft(4, '0'),
          stats: stats,
          types: types,
          pokemonColor: pokemonColor,
          description: descriptionNormalized);
    }).toList();

    return pokemonsVo;
  }
}

extension on String {
  capitalizeFirstLetter() {
    if (isEmpty) {
      return this; // Return empty string if input is empty
    }
    return this[0].toUpperCase() + substring(1);
  }
}
