import 'package:bloc/bloc.dart';
import 'package:pokemon/data/repository/home/home_repository.dart';
import 'package:pokemon/features/home/state/pokemon_detail_state.dart';

class HomeCubit extends Cubit<PokemonState> {
  final HomeRepository _repository = HomeRepository();
  HomeCubit() : super(PokemonLoading());

  Future<void> init() async {
    await getPokemons();
  }

  Future<void> getPokemons() async {
    final pokemons = await _repository.getPokemons();

    emit(PokemonSuccess(pokemons));
  }

  void filterPokemons(String filter) async {
    if (filter.trim().length >= 3) {
      final pokemons = _repository.pokemons.where((pokemon) {
        return pokemon.name.toLowerCase().contains(filter.toLowerCase());
      }).toList();

      emit(PokemonSuccess(pokemons));
    } else if (filter.trim().isEmpty) {
      emit(PokemonSuccess(_repository.pokemons));
    }
  }

  void loadMore() async {
    if (await _repository.allowLoadMore()) {
      emit(PokemonLoadMore(_repository.pokemons));
      final pokemons = await _repository.loadMorePokemons();
      emit(PokemonSuccess(pokemons));
    }
  }

  bool hasReachedMax() => _repository.pokemons.length == _repository.totalPokemons; 
}
