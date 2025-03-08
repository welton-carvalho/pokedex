import 'package:flutter/material.dart';
import 'package:pokemon/data/domain/vo/detail/pokemon_vo.dart';
import 'package:pokemon/design_system/colors.dart';
import 'package:pokemon/design_system/text_styles.dart';
import 'package:pokemon/features/detail/screen/pokemon_detail.dart';

class PokemonCard extends StatelessWidget {
  final PokemonVo pokemon;
  const PokemonCard({super.key, required this.pokemon});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PokemonDetailPage(
                pokemon: pokemon,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            // Fundo cinza na parte inferior
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70, // Altura fixa para o fundo
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            // Conteúdo
            Column(
              mainAxisSize: MainAxisSize.min, // Importante para ajustar o tamanho automaticamente
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ID do Pokemon alinhado à direita
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "#${pokemon.number}",
                      style: TextStyles.caption,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Imagem centralizada
                SizedBox(
                  height: 72,
                  width: 72,
                  child: Image.network(
                    pokemon.image,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Image.asset("images/placeholder_card.png");
                    },
                  ),
                ),
                const SizedBox(height: 4),
                // Nome do Pokemon centralizado na parte inferior
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    pokemon.name,
                    style: TextStyles.body3,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}