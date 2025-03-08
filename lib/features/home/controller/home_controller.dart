import 'package:flutter/widgets.dart';
import 'package:pokemon/data/repository/home/home_repository.dart';
import 'package:pokemon/features/home/state/pokemon_detail_state.dart';

class HomeController extends ValueNotifier<PokemonState> {
  final HomeRepository _repository = HomeRepository();
  HomeController() : super(PokemonLoading());

  Future<void> init() async {
    await getPokemons();
  }

  Future<void> getPokemons() async {
    final pokemons = await _repository.getPokemons();

    value = PokemonSuccess(pokemons);
  }

  Future<void> filterPokemons(String filter) async {
    if (filter.trim().length >= 3) {
      final pokemons = _repository.pokemons.where((pokemon) {
        return pokemon.name.toLowerCase().contains(filter.toLowerCase());
      }).toList();

      value = PokemonSuccess(pokemons);
    } else if (filter.trim().isEmpty) {
      value = PokemonSuccess(_repository.pokemons);
    }
  }

  Future<void> loadMore() async {
    if (await _repository.allowLoadMore()) {
      final pokemons = await _repository.loadMorePokemons();
      value = PokemonSuccess(pokemons);
    }
  }
}
