import 'package:dio/dio.dart';
import 'package:pokemon/data/api/http_config.dart';
import 'package:pokemon/data/domain/dto/detail/pokemon_detail.dart';
import 'package:pokemon/data/domain/dto/detail/specie_result.dart';
import 'package:pokemon/data/domain/dto/home/home_result.dart';

class HomeApi {
  Dio? http;
  int limit = 30;
  HomeApi({this.http}) {
    http ??= HttpConfig.instance.client;
  }

  Future<(List<Pokemon>, int)> listPokemons({int offset = 0}) async {
    try {
      final reponse = await http
          ?.get("/", queryParameters: {'offset': offset, 'limit': limit});

      final home = HomeResult.fromJson(reponse?.data);      
      List<Pokemon> pokemons = [];
      await Future.forEach(home.results, (p) async {
        final pokemonDetail = await http?.get(p.url);
        final pokemon = Pokemon.fromJson(pokemonDetail?.data);

        final speciesReponse = await http?.get(pokemon.species.url);

        final species = SpecieResult.fromJson(speciesReponse?.data);

        pokemon.description = species.descriptions?.first?.description;

        pokemons.add(pokemon);
      });
      return (pokemons,  home.count);
    } catch (error) {
      error;
      return (<Pokemon>[], 0);
    }
  }
}
