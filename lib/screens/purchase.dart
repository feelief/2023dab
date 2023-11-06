import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class Purchase extends StatelessWidget {
  final String url, ingredient;
  const Purchase({
    super.key,
    required this.url,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
          style: ButtonStyle(
            iconSize: MaterialStatePropertyAll(35.0),
            elevation: MaterialStatePropertyAll(3.0),
          ),
        ),
        foregroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      /*IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 35,
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GetRecipe(query: query))),
          ),*/
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
            colors: [
              Colors.white,
              Colors.blueGrey,
              Colors.white,
              Colors.white,
              Colors.black87,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('YOU NEED "$ingredient"',
                style: TextStyle(
                    color: Colors.blueGrey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 30),
            const SpinKitWanderingCubes(
              color: Colors.black,
              size: 50,
              shape: BoxShape.rectangle,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 40),
                const Column(
                  children: [
                    Text(
                      'moving to Purchasing Page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.black87,
                              offset: Offset(1, 1),
                              blurRadius: 2.0)
                        ],
                      ),
                    ),
                    Text(
                      '(ex. Coupang, MarketCulry)',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Colors.black87,
                              offset: Offset(1, 1),
                              blurRadius: 2.0)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.link,
                      size: 30,
                      color: Colors.white,
                      weight: 10,
                      shadows: [
                        Shadow(
                            color: Colors.black87,
                            offset: Offset(1, 1),
                            blurRadius: 2.0)
                      ]),
                  onPressed: () {
                    launchUrl(Uri.parse(url));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
