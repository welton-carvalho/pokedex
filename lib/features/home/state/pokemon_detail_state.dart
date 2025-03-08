import 'package:pokemon/data/domain/vo/detail/pokemon_vo.dart';

sealed class PokemonState {}

class PokemonLoading extends PokemonState {}

class PoKemonError extends PokemonState {}

class PokemonSuccess extends PokemonState {
  final List<PokemonVo> pokemons;
  PokemonSuccess(this.pokemons);
}
