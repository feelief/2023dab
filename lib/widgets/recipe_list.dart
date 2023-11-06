import 'package:dab/screens/recipes.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatelessWidget {
  final String menu, level;
  final List<String> ingredient, recipe, additional, url;
  final int order, time, achievement;
  final AssetImage image;

  const RecipeList({
    super.key,
    required this.menu,
    required this.order,
    required this.time,
    required this.level,
    required this.image,
    required this.ingredient,
    required this.achievement,
    required this.recipe,
    required this.additional,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.circle,
        size: 7,
        color: Colors.white,
      ),
      title: Text(menu,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          )),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GetRecipe(
                    menu: menu,
                    order: order,
                    time: time,
                    level: level,
                    image: image,
                    ingredient: ingredient,
                    achievement: achievement,
                    recipe: recipe,
                    additional: additional,
                    url: url,
                  ))),
    );
  }
}
