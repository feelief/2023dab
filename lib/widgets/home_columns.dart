import 'package:dab/screens/input_photos.dart';
import 'package:flutter/material.dart';

class Main1 extends StatelessWidget {
  const Main1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(width: 5),
              Text('나만의 맞춤형 레시피 보러 가기',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 2),
          GestureDetector(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 1.0,
                  ),
                  color: Colors.blueGrey[50],
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 40),
                    SizedBox(
                      height: 70,
                      child: Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.blueGrey,
                        size: 50,
                      ),
                    ),
                    Text(
                      'take a photo \n of your refrigerator',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TakePhoto()))),
        ],
      ),
    );
  }
}

class Main2 extends StatelessWidget {
  const Main2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                '이번주 인기 레시피 TOP 5',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Rankings(choices: ['추천순', '시간순', '난이도순']),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '더 많은 레시피 보러 가기',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.add_circle_outline_sharp,
                      color: Colors.blueGrey,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Rankings extends StatefulWidget {
  final List<String> choices;

  const Rankings({
    super.key,
    required this.choices,
  });

  @override
  State<Rankings> createState() => _RankingsState();
}

class _RankingsState extends State<Rankings>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: widget.choices.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: TabBar(
            //padding: const EdgeInsets.symmetric(horizontal: 0),
            indicatorWeight: 1.5,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.blueGrey,
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            controller: controller,
            tabs: [
              Tab(text: widget.choices[0]),
              Tab(text: widget.choices[1]),
              Tab(text: widget.choices[2]),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: TabBarView(
            controller: controller!,
            children: const [
              Ranking(
                  menus: ['크림파스타', '떡볶이', '유부초밥', '감자전', '참치야채죽'], order: 1),
              Ranking(
                  menus: ['유부초밥', '크림파스타', '감자전', '떡볶이', '참치야채죽'], order: 2),
              Ranking(
                  menus: ['감자전', '유부초밥', '참치야채죽', '크림파스타', '떡볶이'], order: 3),
            ],
          ),
        )
      ],
    );
  }
}

class Ranking extends StatelessWidget {
  final List<String> menus;
  final int order;

  const Ranking({
    super.key,
    required this.menus,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        RankTile(menu: menus[0], rank: 1, isEven: false),
        RankTile(menu: menus[1], rank: 2, isEven: true),
        RankTile(menu: menus[2], rank: 3, isEven: false),
        RankTile(menu: menus[3], rank: 4, isEven: true),
        RankTile(menu: menus[4], rank: 5, isEven: false),
      ],
    );
  }
}

class RankTile extends StatelessWidget {
  final String menu;
  final int rank;
  final bool isEven;

  const RankTile({
    super.key,
    required this.menu,
    required this.rank,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '$rank',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.blueGrey,
        ),
      ),
      title: Text(menu),
      tileColor: isEven ? Colors.white : Colors.blueGrey[50],
      trailing: IconButton(
        icon: const Icon(
          Icons.more_horiz_sharp,
          color: Colors.blueGrey,
          size: 30,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.blueGrey[800],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              contentTextStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 1.2,
              ),
              content: const SizedBox(
                height: 70,
                child: Center(child: Text('NOT PREPARED YET.')),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context, 'CANCEL'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Main3 extends StatelessWidget {
  const Main3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Colors.blueGrey, width: 0),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '레시피 인증샷 공유하고 코인 받기!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.stars_sharp,
                  color: Colors.amber[600],
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Main4 extends StatelessWidget {
  const Main4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 5),
              Text(
                '다른 사람의 요리 구경하기',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              //SizedBox(width: 5),
              SizedBox(
                width: 70,
                height: 70,
                child: Avatar(
                  assetImage: 'assets/images/steak_bap.jpg',
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Avatar(
                    assetImage: 'assets/images/tteokbokki2.jpg',
                  )),

              SizedBox(width: 5),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Avatar(
                    assetImage: 'assets/images/yooboochobab.jpg',
                  )),
              SizedBox(width: 5),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Avatar(
                    assetImage: 'assets/images/galchijorim.jpg',
                  )),
              SizedBox(width: 5),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Avatar(
                    assetImage: 'assets/images/jeonbokjook.jpg',
                  )),
              SizedBox(width: 5),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Avatar(
                    assetImage: 'assets/images/creampasta.jpg',
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String assetImage;
  const Avatar({
    super.key,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: CircleAvatar(
          backgroundImage: AssetImage(assetImage),
        ),
        onTap: () {
          showDialog(
              barrierColor: Colors.transparent,
              context: context,
              barrierDismissible: true,
              builder: ((context) {
                return AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(assetImage), fit: BoxFit.cover),
                      )),
                );
              }));
        });
  }
}
