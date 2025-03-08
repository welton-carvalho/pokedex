import 'package:flutter/material.dart';
import 'package:pokemon/design_system/colors.dart';
import 'package:pokemon/design_system/text_styles.dart';

class PokemonSearchBar extends StatelessWidget {
  
  const PokemonSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
          hintText: 'Search',
          hintStyle: TextStyle(color: AppColors.white),
          border: InputBorder.none,
        ),
        style: TextStyles.body3.copyWith( color: AppColors.white),
      ),
    );
  }
}