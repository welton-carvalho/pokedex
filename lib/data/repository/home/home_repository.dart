import 'package:pokemon/data/api/home/home_api.dart';
import 'package:pokemon/data/domain/vo/detail/pokemon_vo.dart';
import 'package:pokemon/data/mapper/pokemon_mapper.dart';

class HomeRepository {
  final HomeApi _homeApi = HomeApi();
  late List<PokemonVo> pokemons;
  late int _totalItens;

  HomeRepository();
  Future<List<PokemonVo>> getPokemons() async {
    final response = await _homeApi.listPokemons();
    final (pokemonsDto, totalItens) = response;
    final responseVo = PokemonMapper.mapper(pokemonsDto);
    pokemons = responseVo;
    _totalItens = totalItens;
    return responseVo;
  }

  Future<bool> allowLoadMore() async {
    return Future.value(pokemons.length < _totalItens);
  }


  Future<List<PokemonVo>> loadMorePokemons() async {
    final response = await _homeApi.listPokemons(offset: pokemons.length);
    final (pokemonsDto, totalItens) = response;
    final responseVo = PokemonMapper.mapper(pokemonsDto);
    pokemons.addAll(responseVo);
    _totalItens = totalItens;
    return pokemons;
  }


}
