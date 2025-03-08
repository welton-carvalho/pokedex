import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  final Animation<double> animation;
  const BottomLoader({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value * 2 * 3.1415,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'images/loading_pokeball.png', // Certifique-se de ter uma imagem da Pokébola no diretório assets
              width: 50,
              height: 50,
            ),
          ),
        );
      },
    );
  }
}
