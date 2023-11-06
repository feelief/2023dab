import 'package:dab/screens/home_screen.dart';
import 'package:dab/screens/input_photos.dart';
import 'package:dab/widgets/recipe_cards.dart';
import 'package:flutter/material.dart';

import '../widgets/recipe_list.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({
    super.key,
    required this.query,
  });

  final List<String> query;

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
            colors: [
              Colors.blueGrey.withOpacity(0.9),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.blueGrey.withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          //원래 Center 씌웠었음
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Transform.translate(
                  offset: const Offset(0, 15),
                  child: Container(
                      height: 60,
                      width: 320,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      alignment: Alignment.center,
                      //child: Text(
                      // widget.query.join(', '),
                      //  style: const TextStyle(
                      //    fontSize: 15,
                      //  ),
                      // ),
                      child: Row(
                        children: [
                          Flexible(
                            child: RichText(
                              overflow:
                                  TextOverflow.ellipsis, //말줄임표로 overflow 표시
                              maxLines: 2,
                              strutStyle: const StrutStyle(fontSize: 15),
                              text: TextSpan(
                                text: widget.query.join(', '),
                                style: TextStyle(
                                  height: 1.4,
                                  fontSize: 16,
                                  color: Colors.blueGrey[800],
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )),
                ),
                Text(
                  "You have",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Colors.transparent,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 40),
                const Text(
                  "총 n개의 추천 레시피가 있습니다!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    textBaseline: TextBaseline.ideographic,
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: Icon(Icons.format_list_bulleted_sharp,
                      size: 30,
                      color: Colors.blueGrey,
                      shadows: [
                        Shadow(
                          offset: const Offset(3, 3),
                          blurRadius: 2.0,
                          color: Colors.blueGrey.withOpacity(0.3),
                        ),
                      ]),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        backgroundColor: Colors.blueGrey[800],
                        title: const Text('RECOMMENDATIONS',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        children: const <Widget>[
                          RecipeList(
                            menu: '가지말이구이',
                            order: 1,
                            time: 30,
                            level: '쉬움',
                            image: AssetImage('assets/images/gajiroll.jpg'),
                            ingredient: [
                              '버터(조금), 가지(1개), 소고기(100g), 무순(20g), 당근(20g), 버섯(20g), 사과(20g), 소금(조금)'
                            ],
                            achievement: 85,
                            recipe: [
                              '1. 준비된  채소를 깨끗하게 손질한다.',
                              '2. 속 재료가 될 과일과 채소는 길이를 비슷하게  잘라주고, 가지는 얇게 저며 준다.',
                              '3. 소고기와 가지에 소금을 뿌려 밑간을 한다.',
                              '4. 달궈진 팬에 버섯을 볶은 후 고기를 익혀준다.',
                              '5. 익은 고기를 속 재료 크기와 같게 잘라준다.',
                              '6. 버터(오일) 두른 달궈진 팬에 가지를 앞뒤로 고루 구워준다.',
                              '7. 구운 가지에 준비한 속 재료를 넣고 말아준다.',
                            ],
                            additional: ['가지', '무순', '버섯', '버터'],
                            url: [
                              'https://www.coupang.com/np/search?component=&q=%EA%B0%80%EC%A7%80&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%EB%AC%B4%EC%88%9C&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%EB%B2%84%EC%84%AF&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%EB%B2%84%ED%84%B0&channel=user'
                            ],
                          ),
                          RecipeList(
                            menu: '쇠고기장조림',
                            order: 2,
                            time: 30,
                            level: '보통',
                            image: AssetImage('assets/images/jangjorim.jpg'),
                            ingredient: [
                              '쇠고기(400g), 대파(1/2뿌리), 마늘(1통), 생강(1쪽), 물(4컵), 계란(4개), 홍고추(2개), 진간장(1컵), 설탕(1/4컵), 참기름(약간)'
                            ],
                            achievement: 70,
                            recipe: [
                              '1. 쇠고기는 큼직하게 토막 낸 후 기름기와 힘줄을 없앤다.',
                              '마늘은 통으로 준비하고 생강은 얇게 저민다. 홍고추는 어슷하게 썰어 씨를 털어낸다.',
                              '3. 계란은 삶아 찬물에 담갔다가 껍질을 벗긴다. 당근은 손질하여 도톰하게 반달모양으로 썰어낸다.',
                              '4. 냄비에 쇠고기와 마늘, 생강을 넣고 잠길 정도로 물을 부어 끓이다가 불을 줄여 익힌다.',
                              '5. 국물의 1/3쯤 졸면 진간장과 설탕을 넣고 약한 불에서 계속 졸이다가 조림간장이 반으로 줄면 준비한 계란, 당근, 홍고추를 넣는다.',
                              '6. 계란은 주걱으로 굴려가며 간이 고루 배게 한다. 상에 낼 때는 깨소금을 뿌린다.',
                            ],
                            additional: ['대파', '마늘', '생강', '홍고추'],
                            url: [
                              'https://www.coupang.com/np/search?component=&q=%EB%8C%80%ED%8C%8C&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%EB%A7%88%EB%8A%98&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%EC%83%9D%EA%B0%95&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%ED%99%8D%EA%B3%A0%EC%B6%94&channel=user'
                            ],
                          ),
                          RecipeList(
                            menu: '새우죽',
                            order: 3,
                            time: 30,
                            level: '쉬움',
                            image: AssetImage('assets/images/shrimpzuk.jpg'),
                            ingredient: [
                              '쌀(1컵), 새우(200g), 소금(약간), 참기름(약간), 물(6컵)'
                            ],
                            achievement: 100,
                            recipe: [
                              '1. 새우는 꼬치로 등쪽의 내장을 빼고, 옅은 소금물에 씻은 뒤 물기를 제거하고 굵게 다진다.',
                              '2. 쌀은 씻어 물에 충분히 불린 뒤 건져 물기를 뺀다.',
                              '3. 냄비에 참기름을 두르고 다진 새우와 쌀을 넣고 볶다가 쌀알이 투명해지면 물을 붓고 끓인다.',
                              '4. 한소끔 끓어 오르면 불을 약하게 한 뒤 쌀알이 푹 퍼지도록 끓인다.',
                              '5. 쌀알이 퍼지면 소금으로 간을 하고 그릇에 담는다.',
                            ],
                            additional: [],
                            url: [],
                          ),
                          RecipeList(
                            menu: '유부초밥',
                            order: 4,
                            time: 20,
                            level: '보통',
                            image: AssetImage('assets/images/yooboochobab.jpg'),
                            ingredient: [
                              '유부(5장), 우엉(1/3뿌리), 쇠고기(30g), 당근(1/4개), 밥(1공기), 간장(2큰술), 청주(1큰술), 설탕(1큰술), 후춧가루(조금)'
                            ],
                            achievement: 80,
                            recipe: [
                              '1. 유부는 기름을 떼고 어슷하게 반으로 갈라 끓는물에 데쳐 찬물에 헹궈 부드럽게 해 놓는다.',
                              '2. 준비한 우엉, 당근은 깨끗이 씻어 곱게 다진다.',
                              '3. 분량의 재료를 넣어 만든 조림장을 끓이다가 다진 우엉, 당근, 쇠고기를 넣고 국물이 없어질 때 까지 은근하게 조린다.',
                              '4. 채소와 고기가 어느정도 조려지면 마지막에 유부를 뒤집어 넣고 뒤적여 맛을 들인다.',
                              '5. 고슬고슬하게 지은 밥에 조린 우엉, 당근, 고기를 넣어 골고루 잘 섞어준다.',
                              '6. 간이 밴 유부를 왼손에 뒤집어 잡고 오른손으로 밥을 꼭꼭 눌러 유부 안으로 넣은 다음 오므린다.',
                            ],
                            additional: ['우엉', '유부'],
                            url: [
                              'https://www.coupang.com/np/search?component=&q=%EC%9A%B0%EC%97%89&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%EC%9C%A0%EB%B6%80&channel=user',
                            ],
                          ),
                          RecipeList(
                            menu: '김치적',
                            order: 5,
                            time: 25,
                            level: '쉬움',
                            image: AssetImage('assets/images/kimchi_jeok.jpg'),
                            ingredient: [
                              '김치(200g), 쇠고기(100g), 표고버섯(5장), 통도라지(100g), 밀가루(1/2컵), 계란(3개), 식용유(3큰술), 참기름(약간), 소금(약간)'
                            ],
                            achievement: 90,
                            recipe: [
                              '1. 김치는 소를 털어내고 줄기만 길이 8cm, 너비 2cm로 썰어 참기름을 고루 묻힌다.',
                              '2. 쇠고기는 도톰하게 포를 떠 잔칼질하여 김치보다 약간 길게 썬다.',
                              '3. 표고버섯은 1cm 폭으로 썰고 도라지는 삶아서 반으로 갈라 참기름과 소금으로 무친다.',
                              '4. 준비된 재료를 꼬치에 꽂아 밀가루를 묻힌 후 계란물을 묻혀 기름에 지진다.'
                            ],
                            additional: ['김치', '밀가루', '통도라지', '표고버섯'],
                            url: [
                              'https://www.coupang.com/np/search?component=&q=%EA%B9%80%EC%B9%98&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%EB%B0%80%EA%B0%80%EB%A3%A8&channel=user',
                              'https://xn--coupang-h691a.com/np/search?component=&q=%ED%86%B5%EB%8F%84%EB%9D%BC%EC%A7%80&channel=user',
                              'https://www.coupang.com/np/search?component=&q=%ED%91%9C%EA%B3%A0%EB%B2%84%EC%84%AF&channel=user',
                            ],
                          )
                        ],
                      ),
                    ).then(
                      (returnVal) {
                        if (returnVal != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('you clicked: $returnVal'),
                              action:
                                  SnackBarAction(label: 'OK', onPressed: () {}),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
            const Stack(
              alignment: Alignment.center,
              children: [
                RecipeCards(
                  menu: '김치적',
                  order: 5,
                  time: 25,
                  level: '쉬움',
                  image: AssetImage('assets/images/kimchi_jeok.jpg'),
                  ingredient: [
                    '김치(200g), 쇠고기(100g), 표고버섯(5장), 통도라지(100g), 밀가루(1/2컵), 계란(3개), 식용유(3큰술), 참기름(약간), 소금(약간)'
                  ],
                  achievement: 90,
                  recipe: [
                    '1. 김치는 소를 털어내고 줄기만 길이 8cm, 너비 2cm로 썰어 참기름을 고루 묻힌다.',
                    '2. 쇠고기는 도톰하게 포를 떠 잔칼질하여 김치보다 약간 길게 썬다.',
                    '3. 표고버섯은 1cm 폭으로 썰고 도라지는 삶아서 반으로 갈라 참기름과 소금으로 무친다.',
                    '4. 준비된 재료를 꼬치에 꽂아 밀가루를 묻힌 후 계란물을 묻혀 기름에 지진다.'
                  ],
                  additional: ['김치', '밀가루', '통도라지', '표고버섯'],
                  url: [
                    'https://www.coupang.com/np/search?component=&q=%EA%B9%80%EC%B9%98&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%EB%B0%80%EA%B0%80%EB%A3%A8&channel=user',
                    'https://xn--coupang-h691a.com/np/search?component=&q=%ED%86%B5%EB%8F%84%EB%9D%BC%EC%A7%80&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%ED%91%9C%EA%B3%A0%EB%B2%84%EC%84%AF&channel=user',
                  ],
                ),
                RecipeCards(
                  menu: '유부초밥',
                  order: 4,
                  time: 20,
                  level: '보통',
                  image: AssetImage('assets/images/yooboochobab.jpg'),
                  ingredient: [
                    '유부(5장), 우엉(1/3뿌리), 쇠고기(30g), 당근(1/4개), 밥(1공기), 간장(2큰술), 청주(1큰술), 설탕(1큰술), 후춧가루(조금)'
                  ],
                  achievement: 80,
                  recipe: [
                    '1. 유부는 기름을 떼고 어슷하게 반으로 갈라 끓는물에 데쳐 찬물에 헹궈 부드럽게 해 놓는다.',
                    '2. 준비한 우엉, 당근은 깨끗이 씻어 곱게 다진다.',
                    '3. 분량의 재료를 넣어 만든 조림장을 끓이다가 다진 우엉, 당근, 쇠고기를 넣고 국물이 없어질 때 까지 은근하게 조린다.',
                    '4. 채소와 고기가 어느정도 조려지면 마지막에 유부를 뒤집어 넣고 뒤적여 맛을 들인다.',
                    '5. 고슬고슬하게 지은 밥에 조린 우엉, 당근, 고기를 넣어 골고루 잘 섞어준다.',
                    '6. 간이 밴 유부를 왼손에 뒤집어 잡고 오른손으로 밥을 꼭꼭 눌러 유부 안으로 넣은 다음 오므린다.',
                  ],
                  additional: ['우엉', '유부'],
                  url: [
                    'https://www.coupang.com/np/search?component=&q=%EC%9A%B0%EC%97%89&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%EC%9C%A0%EB%B6%80&channel=user',
                  ],
                ),
                RecipeCards(
                  menu: '새우죽',
                  order: 3,
                  time: 30,
                  level: '쉬움',
                  image: AssetImage('assets/images/shrimpzuk.jpg'),
                  ingredient: ['쌀(1컵), 새우(200g), 소금(약간), 참기름(약간), 물(6컵)'],
                  achievement: 100,
                  recipe: [
                    '1. 새우는 꼬치로 등쪽의 내장을 빼고, 옅은 소금물에 씻은 뒤 물기를 제거하고 굵게 다진다.',
                    '2. 쌀은 씻어 물에 충분히 불린 뒤 건져 물기를 뺀다.',
                    '3. 냄비에 참기름을 두르고 다진 새우와 쌀을 넣고 볶다가 쌀알이 투명해지면 물을 붓고 끓인다.',
                    '4. 한소끔 끓어 오르면 불을 약하게 한 뒤 쌀알이 푹 퍼지도록 끓인다.',
                    '5. 쌀알이 퍼지면 소금으로 간을 하고 그릇에 담는다.',
                  ],
                  additional: [],
                  url: [],
                ),
                RecipeCards(
                  menu: '쇠고기장조림',
                  order: 2,
                  time: 30,
                  level: '보통',
                  image: AssetImage('assets/images/jangjorim.jpg'),
                  ingredient: [
                    '쇠고기(400g), 대파(1/2뿌리), 마늘(1통), 생강(1쪽), 물(4컵), 계란(4개), 홍고추(2개), 진간장(1컵), 설탕(1/4컵), 참기름(약간)'
                  ],
                  achievement: 70,
                  recipe: [
                    '1. 쇠고기는 큼직하게 토막 낸 후 기름기와 힘줄을 없앤다.',
                    '마늘은 통으로 준비하고 생강은 얇게 저민다. 홍고추는 어슷하게 썰어 씨를 털어낸다.',
                    '3. 계란은 삶아 찬물에 담갔다가 껍질을 벗긴다. 당근은 손질하여 도톰하게 반달모양으로 썰어낸다.',
                    '4. 냄비에 쇠고기와 마늘, 생강을 넣고 잠길 정도로 물을 부어 끓이다가 불을 줄여 익힌다.',
                    '5. 국물의 1/3쯤 졸면 진간장과 설탕을 넣고 약한 불에서 계속 졸이다가 조림간장이 반으로 줄면 준비한 계란, 당근, 홍고추를 넣는다.',
                    '6. 계란은 주걱으로 굴려가며 간이 고루 배게 한다. 상에 낼 때는 깨소금을 뿌린다.',
                  ],
                  additional: ['대파', '마늘', '생강', '홍고추'],
                  url: [
                    'https://www.coupang.com/np/search?component=&q=%EB%8C%80%ED%8C%8C&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%EB%A7%88%EB%8A%98&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%EC%83%9D%EA%B0%95&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%ED%99%8D%EA%B3%A0%EC%B6%94&channel=user'
                  ],
                ),
                RecipeCards(
                  menu: '가지말이구이',
                  order: 1,
                  time: 30,
                  level: '쉬움',
                  image: AssetImage('assets/images/gajiroll.jpg'),
                  ingredient: [
                    '버터(조금), 가지(1개), 소고기(100g), 무순(20g), 당근(20g), 버섯(20g), 사과(20g), 소금(조금)'
                  ],
                  achievement: 85,
                  recipe: [
                    '1. 준비된  채소를 깨끗하게 손질한다.',
                    '2. 속 재료가 될 과일과 채소는 길이를 비슷하게  잘라주고, 가지는 얇게 저며 준다.',
                    '3. 소고기와 가지에 소금을 뿌려 밑간을 한다.',
                    '4. 달궈진 팬에 버섯을 볶은 후 고기를 익혀준다.',
                    '5. 익은 고기를 속 재료 크기와 같게 잘라준다.',
                    '6. 버터(오일) 두른 달궈진 팬에 가지를 앞뒤로 고루 구워준다.',
                    '7. 구운 가지에 준비한 속 재료를 넣고 말아준다.',
                  ],
                  additional: ['가지', '무순', '버섯', '버터'],
                  url: [
                    'https://www.coupang.com/np/search?component=&q=%EA%B0%80%EC%A7%80&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%EB%AC%B4%EC%88%9C&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%EB%B2%84%EC%84%AF&channel=user',
                    'https://www.coupang.com/np/search?component=&q=%EB%B2%84%ED%84%B0&channel=user'
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey[600],
      centerTitle: true,
      elevation: 5,
      shadowColor: Colors.grey,
      leading: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          iconSize: 35,
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
                  content: const Text('재촬영하시겠습니까?'),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.check_box_outline_blank_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.check_box_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TakePhoto()),
                      ),
                    )
                  ]),
            );
          }),
      title: const Text(
        "Today's Recommendation",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.home_filled,
            color: Colors.blueGrey[800],
          ),
          iconSize: 35,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeSreen()),
          ),
        ),
      ],
    );
  }
}
