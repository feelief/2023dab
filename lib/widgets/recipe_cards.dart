//import 'dart:html';

import 'package:dab/screens/recipes.dart';
import 'package:flutter/material.dart';

class RecipeCards extends StatelessWidget {
  final String menu, level;
  final List<String> ingredient, recipe, additional, url;
  final int order, time, achievement;
  final AssetImage image;

  const RecipeCards({
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
    return Transform.translate(
      offset: Offset((order - 1) * 5, (order - 1) * 7),
      child: Dismissible(
        key: Key(menu),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {}
          if (direction == DismissDirection.startToEnd) {
            Navigator.push(
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
                        url: url)));
          }
        },
        child: Container(
          height: 380,
          width: 320,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blueGrey,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 10),
                )
              ]),
          child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: Column(
                children: [
                  Text(
                    menu,
                    style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 180,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 2,
                      ),
                      image: DecorationImage(image: image, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "재료 : ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        overflow: TextOverflow
                                            .ellipsis, //말줄임표로 overflow 표시
                                        maxLines: 3,
                                        strutStyle:
                                            const StrutStyle(fontSize: 15),
                                        text: TextSpan(
                                          text: ingredient.join(', '),
                                          style: const TextStyle(
                                            height: 1.4,
                                            fontSize: 15,
                                          ),
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "난이도 : ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              level,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "조리 시간 : ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "$time 분",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
