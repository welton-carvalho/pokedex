import '../detail/pokemon_vo.dart';

class HomeVo {
  final List<PokemonVo> pokemons;
  final int limitPokemons;
  HomeVo(this.pokemons, this.limitPokemons);
}
