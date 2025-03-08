import 'package:flutter/material.dart';
import 'package:pokemon/design_system/theme.dart';
import 'package:pokemon/features/home/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: pokemonTheme,
      debugShowCheckedModeBanner: false,      
      showPerformanceOverlay: false,      
      checkerboardOffscreenLayers: false,
      showSemanticsDebugger: false,
      home: HomePage(title: 'Pokemon'),
    );
  }
}

