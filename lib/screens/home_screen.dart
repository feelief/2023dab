import 'package:dab/widgets/home_columns.dart';
import 'package:flutter/material.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey.withOpacity(0.1),
        title: Text('RECIPE JUST FOR YOU',
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey[700],
              fontWeight: FontWeight.w600,
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Main1(),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                    height: 1.3,
                    decoration: const BoxDecoration(color: Colors.blueGrey)),
              ),
              const SizedBox(height: 2),
              const Main4(),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                    height: 1.3,
                    decoration: const BoxDecoration(color: Colors.blueGrey)),
              ),
              const Main3(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                    height: 1.3,
                    decoration: const BoxDecoration(color: Colors.blueGrey)),
              ),
              const SizedBox(height: 2),
              const Main2(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                    height: 1.3,
                    decoration: const BoxDecoration(color: Colors.blueGrey)),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
      /*bottomSheet: BottomAppBar(
        color: Colors.white,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 40),
            Container(
              width: 260,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(width: 5),
            const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.search,
                color: Colors.blueGrey,
                size: 35,
              ),
            )
          ],
        ),
      ),
      */
    );
  }
}
