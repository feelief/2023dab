import 'dart:async';
import 'package:dab/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 6),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeSreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        /*decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.white,
              Colors.black,
              Colors.blueGrey,
            ],
          ),
          NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/dab-6cfc3.appspot.com/o/images%2Frefrigerator.png?alt=media&token=00b02b42-1a91-4d41-833b-0be2c8e2500f')
        ), */

        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.dstATop,
              ),
              image: const AssetImage('assets/images/refrigerator.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(3, 2),
                          child: const Text('Recipe\nJust\nFor\nYou',
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    offset: Offset(3, 3),
                                    color: Colors.blueGrey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: 0.8,
                              )),
                        ),
                        const Text('Recipe\nJust\nFor\nYou',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.8,
                            )),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Stack(
                      children: [
                        SpinKitFadingCube(
                          color: Colors.blueGrey[800],
                          size: 53.0,
                        ),
                        const SpinKitFadingCube(
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(1, 1),
                      child: const Text(
                        'The AI Service Just For Your Refrigerator\nThat Can Make Your Cooking Life Easier',
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                offset: Offset(1, 1),
                                color: Colors.blueGrey,
                                blurRadius: 5.0)
                          ],
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text(
                      'The AI Service Just For Your Refrigerator\nThat Can Make Your Cooking Life Easier',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
