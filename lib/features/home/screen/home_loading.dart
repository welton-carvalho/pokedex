import 'package:flutter/material.dart';
import 'package:pokemon/design_system/colors.dart';

class HomeLoading extends StatefulWidget {
  const HomeLoading({super.key});

  @override
  State<HomeLoading> createState() => _HomeLoadingState();
}

class _HomeLoadingState extends State<HomeLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Duração do ciclo de animação
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    )
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat(reverse: true); // Repete a animação para frente e para trás
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Opacity(
                opacity: _animation.value, // Usa a animação para controlar a opacidade
                child: Image.asset(
                  'images/loading_pokeball.png', // Certifique-se de ter a imagem da Pokébola no diretório de assets
                  width: 150.0,
                  height: 150.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Carregando...',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
