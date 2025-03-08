import 'package:flutter/material.dart';
import 'package:pokemon/design_system/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onFilterChanged;
  const CustomAppBar({super.key, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
     final TextEditingController controller = TextEditingController();
     
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/lead_pokeball.png', // Certifique-se de ter a imagem no diretório assets
                    height: 30.0,
                    width: 30.0,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Pokédex',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  controller: controller,
                  onChanged: (value) => onFilterChanged(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: AppColors.medium),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.0);
}