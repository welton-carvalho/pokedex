import 'package:flutter/material.dart';
import 'package:pokemon/design_system/colors.dart';
import 'package:pokemon/design_system/components/custom_appbar.dart';
import 'package:pokemon/design_system/components/pokemon_card.dart';
import 'package:pokemon/features/home/controller/home_controller.dart';
import 'package:pokemon/features/home/screen/home_loading.dart';
import 'package:pokemon/features/home/state/pokemon_detail_state.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  final HomeController controller = HomeController();
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get _controller => widget.controller;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _controller.init();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onFilterChanged: (search) {
          _controller.filterPokemons(search);
        },
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox.expand(
        child: Center(
          child: ValueListenableBuilder<PokemonState>(
            valueListenable: _controller,
            builder: (context, state, widget) {
              switch (state) {
                case PokemonLoading _:
                  return HomeLoading();
                case PoKemonError _:
                  return Text("Error");
                case PokemonSuccess state:
                  final pokemons = state.pokemons;
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin:
                        EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 12),
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.only(top: 24),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.7,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return PokemonCard(pokemon: pokemons[index]);
                              },
                              childCount: pokemons.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      widget.controller.loadMore();
    }
  }
}
