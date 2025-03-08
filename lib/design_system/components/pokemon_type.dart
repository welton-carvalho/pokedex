import 'package:flutter/material.dart';
import 'package:pokemon/design_system/colors.dart';

class PokemonTypeWidget extends StatelessWidget {
  final String type;
  final Color colorType;

  const PokemonTypeWidget({super.key, required this.type, required this.colorType});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorType,
        borderRadius: BorderRadius.circular(15.0),
      ),      
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Semantics(
          label: type,
          child: Text(
            type,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),          
          ),
        ),
      ),
    );
  }
}