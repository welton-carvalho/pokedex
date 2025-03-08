import 'package:flutter/material.dart';
import 'package:pokemon/data/domain/vo/detail/pokemon_vo.dart';
import 'package:pokemon/design_system/colors.dart';
import 'package:pokemon/design_system/components/pokemon_type.dart';
import 'package:pokemon/design_system/text_styles.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonVo pokemon;
  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.pokemon.pokemonColor,
        child: Stack(
          children: [
            Column(
              children: [
                _pokeball(),
                _statsWidget(),
              ],
            ),
            _header(),
            _pokemonImage(),
          ],
        ),
      ),
    );
  }

  Row _pokeball() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            height: 208, width: 208, child: Image.asset("images/pokeball.png")),
      ],
    );
  }

  Padding _pokemonImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 75),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Image.asset("images/placeholder_card.png");
              }, fit: BoxFit.fill, widget.pokemon.image),
            ),
          ],
        ),
      ),
    );
  }

  _header() {
    return Positioned(
      top: 40,
      right: 0,
      left: 30,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        spacing: 16,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              "images/arrow_back.png",
              width: 32,
              height: 32,
            ),
          ),
          Text(
            widget.pokemon.name,
            style: TextStyles.headline.copyWith(color: AppColors.white),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "#${widget.pokemon.number}",
                  style: TextStyles.subTitle2.copyWith(color: AppColors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _statsWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 54),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PokemonTypeWidget(
                      type: widget.pokemon.types[0].name,
                      colorType: widget.pokemon.pokemonColor,
                    ),
                  ],
                ),
              ),
              Text(
                "About",
                style: TextStyles.subTitle1
                    .copyWith(color: widget.pokemon.pokemonColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 32,
                              child: SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset("images/weight.png")),
                            ),
                            Text(
                              widget.pokemon.weight,
                              style: TextStyles.body3.copyWith(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                        child: Row(
                          children: [
                            Text(
                              "Weight",
                              style: TextStyles.caption
                                  .copyWith(color: AppColors.medium),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 48,
                    width: 1,
                    child: Divider(
                      color: AppColors.medium,
                      height: 48,
                      thickness: 30,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 32,
                            child: SizedBox(
                                height: 16,
                                width: 16,
                                child: Image.asset("images/straighten.png")),
                          ),
                          Text(
                            widget.pokemon.height,
                            style: TextStyles.body3.copyWith(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                        child: Row(
                          children: [
                            Text(
                              "Height",
                              style: TextStyles.caption
                                  .copyWith(color: AppColors.medium),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  
                    widget.pokemon.description,
                    textAlign: TextAlign.justify,
                    style: TextStyles.body3.copyWith(
                      fontSize: 14
                    ),
                ),
              ),
              _baseStats()
            ],
          ),
        ),
      ),
    );
  }

  _baseStats() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Base Stats",
          style: TextStyles.subTitle1.copyWith(
            fontSize: 24,
            color: widget.pokemon.pokemonColor,
          ),
        ),
        _rowStats()
      ],
    );
  }

  _rowStats() {
    List<Widget> widgets = [];
    for (var stats in widget.pokemon.stats) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          top: 8.0,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Text(
                textAlign: TextAlign.end,
                stats.name,
                style: TextStyles.subTitle3
                    .copyWith(color: widget.pokemon.pokemonColor, fontSize: 16),
              ),
            ),
            VerticalDivider(
              width: 10,
              thickness: 10,
            ),
            Text(
              stats.value,
              style: TextStyles.body3.copyWith(fontSize: 16),
            ),
            VerticalDivider(
              width: 10,
              thickness: 10,
            ),
            SizedBox(
              width: 200,
              height: 4,
              child: LinearProgressIndicator(
                backgroundColor: widget.pokemon.pokemonColor.withAlpha(20),
                value: stats.progressValue,
                borderRadius: BorderRadius.circular(8),
                valueColor: AlwaysStoppedAnimation(widget.pokemon.pokemonColor),
              ),
            )
          ],
        ),
      ));
    }
    return Column(
      children: widgets,
    );
  }
}
