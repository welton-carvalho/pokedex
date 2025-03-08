import 'package:flutter/material.dart';
import 'package:pokemon/design_system/colors.dart';
import 'package:pokemon/design_system/text_styles.dart';

ThemeData pokemonTheme = ThemeData(
  primaryColor: AppColors.primary,  
  scaffoldBackgroundColor: AppColors.background,
  textTheme: TextTheme(
    headlineLarge: TextStyles.headline,
    headlineMedium: TextStyles.headline,
    headlineSmall: TextStyles.headline,
    titleLarge: TextStyles.subTitle1,
    titleMedium: TextStyles.subTitle2,
    titleSmall: TextStyles.subTitle3,
    bodyLarge: TextStyles.body1,
    bodyMedium: TextStyles.body2,
    bodySmall: TextStyles.body3
  ),
  colorScheme: ColorScheme.fromSeed(primary: AppColors.primary, seedColor: AppColors.primary),
  useMaterial3: true,
);
