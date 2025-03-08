import 'package:flutter/material.dart';
import 'package:pokemon/data/domain/vo/detail/pokemon_vo.dart';
import 'package:pokemon/design_system/colors.dart';
import 'package:pokemon/design_system/components/custom_appbar.dart';
import 'package:pokemon/design_system/components/pokemon_card.dart';
import 'package:pokemon/features/home/cubit/home_cubit.dart';
import 'package:pokemon/features/home/screen/bottom_loader.dart';
import 'package:pokemon/features/home/screen/home_loading.dart';
import 'package:pokemon/features/home/state/pokemon_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    context.read<HomeCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onFilterChanged: (search) {
          context.read<HomeCubit>().filterPokemons(search);
        },
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox.expand(
        child: Center(
          child: BlocBuilder<HomeCubit, PokemonState>(
            builder: (context, state) {
              switch (state) {
                case PokemonLoading _:
                  return HomeLoading();
                case PoKemonError _:
                  return Text("Error");
                case PokemonSuccess state:
                  return _pokemonList(state.pokemons);
                case PokemonLoadMore state:
                  return _pokemonList(state.pokemons, true);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Container _pokemonList(List<PokemonVo> pokemons, [bool isLoading = false]) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 12),
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return PokemonCard(pokemon: pokemons[index]);
                },
                childCount: pokemons.length,
              ),
            ),
          ),
          if (isLoading)
            SliverToBoxAdapter(
              child: Center(
                child: BottomLoader(
                  animation: _animationController,
                ),
              ),
            ),
        ],
      ),
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<HomeCubit>().loadMore();
    }
  }
}
