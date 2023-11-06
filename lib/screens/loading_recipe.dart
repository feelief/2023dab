import 'dart:async';

import 'package:dab/screens/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/you_have.dart';

class LoadingRecipe extends StatefulWidget {
  const LoadingRecipe({super.key});

  @override
  State<LoadingRecipe> createState() => _LoadingRecipeState();
}

class _LoadingRecipeState extends State<LoadingRecipe> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MoveToResult()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.black,
              Colors.blueGrey,
            ],
          ),
        ),
        /*
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/steak_bap.jpg'), fit: BoxFit.contain),
          ),*/
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 30),
            Text('Searching for Recipes',
                style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      color: Colors.blueGrey,
                      blurRadius: 3.0,
                    )
                  ],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.8,
                )),
          ],
        ),
      ),
    );
  }
}

class MoveToResult extends StatelessWidget {
  MoveToResult({super.key});

  final List<String> query = [
    '양파',
    '시금치',
    '김치',
    '치즈',
    '돼지고기',
    '두부',
    '버섯',
    '새우',
    '당면'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        //padding: const EdgeInsets.only(left: 15),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.black,
              Colors.blueGrey,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            YouHave(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                const Text(
                  'See Recipe Recommendations',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 2.0,
                          color: Colors.blueGrey)
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 35,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Recommendation(query: query)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
