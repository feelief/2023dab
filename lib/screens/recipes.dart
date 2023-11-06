import 'package:dab/screens/home_screen.dart';
import 'package:dab/screens/purchase.dart';
import 'package:dab/screens/recommendation.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter_firestore/document_view.dart';

class GetRecipe extends StatelessWidget {
  final String menu, level;
  final List<String> ingredient, recipe, additional, url;
  final int order, time, achievement;
  final AssetImage image;
  final List<Widget> additionals = [];
  final List<Widget> steps = [];
  final List<String> query = [
    '빵',
    '계란',
    '당근',
    '사과',
    '다진 소고기',
    '닭고기',
    '치즈',
    '설탕',
    '새우'
  ];

  GetRecipe({
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

  List<Widget> adding() {
    int i = 0;
    while (i < additional.length) {
      additionals.add(Additional(url: url[i], additional: additional[i]));
      i = i + 1;
    }
    return additionals;
  }

  List<Widget> addSteps() {
    int i = 0;
    while (i < recipe.length) {
      steps.add(Steps(step: recipe[i]));
      i = i + 1;
    }
    return steps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.grey,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 35,
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Recommendation(query: query))),
          ),
          title: Text(
            menu,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.home_filled),
              iconSize: 35,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeSreen()),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(children: [
              Text('$menu 레시피',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(width: 400, height: 5),
              Container(
                height: 2,
                decoration: const BoxDecoration(color: Colors.blueGrey),
              ),
              const SizedBox(width: 400, height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "재료 : ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 280,
                            child: Row(
                              children: [
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow
                                        .ellipsis, //말줄임표로 overflow 표시
                                    maxLines: 5,
                                    strutStyle: const StrutStyle(fontSize: 18),
                                    text: TextSpan(
                                      text: ingredient.join(', '),
                                      style: const TextStyle(
                                        height: 1.4,
                                        fontSize: 16,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "난이도 : ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          level,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "조리 시간 : ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$time 분",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 400,
                height: 10,
              ),
              Container(
                height: 2,
                decoration: const BoxDecoration(color: Colors.blueGrey),
              ),
              const SizedBox(width: 400, height: 10),
              const Row(
                children: [
                  Text('더 필요한 재료',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: adding(),
                ),
              ),
              const SizedBox(
                width: 400,
                height: 15,
              ),
              const Row(
                children: [
                  Text('조리 순서',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              Container(
                height: 2,
                decoration: const BoxDecoration(color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: addSteps(),
                ),
              )
            ]),
          ),
        ));
  }
}

class Steps extends StatelessWidget {
  final String step;

  const Steps({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: RichText(
                overflow: TextOverflow.ellipsis, //말줄임표로 overflow 표시
                maxLines: 10,
                strutStyle: const StrutStyle(fontSize: 18),
                text: TextSpan(
                  text: step,
                  style: const TextStyle(
                    height: 1.4,
                    fontSize: 18,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 400,
          height: 30,
        ),
      ],
    );
  }
}

class Additional extends StatelessWidget {
  final String additional;
  final String url;

  const Additional({
    super.key,
    required this.additional,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            additional,
            style: const TextStyle(
              fontSize: 18,
              textBaseline: TextBaseline.ideographic,
            ),
          ),
          Transform.translate(
            offset: const Offset(-8, 0),
            child: IconButton(
              icon: const Icon(
                Icons.link,
                size: 20,
                weight: 5,
              ),
              color: Colors.blueGrey,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Purchase(url: url, ingredient: additional),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
