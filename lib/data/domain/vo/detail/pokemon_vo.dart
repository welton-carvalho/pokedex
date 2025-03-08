import 'package:flutter/material.dart';

import 'pokemon_stat_vo.dart';
import 'pokemon_type_vo.dart';

class PokemonVo {
  final String number;
  final String image;
  final String name;
  final List<PokemonTypeVo> types;
  final String height;
  final String weight;
  final List<PokemonStatsVo> stats;
  final Color pokemonColor;
  final String description;

  PokemonVo({
    required this.number,
    required this.image,
    required this.name,
    required this.types,
    required this.height,
    required this.weight,
    required this.stats,
    required this.pokemonColor,
    required this.description,
  });
}
