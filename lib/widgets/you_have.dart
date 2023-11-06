import 'package:flutter/material.dart';

class YouHave extends StatelessWidget {
  YouHave({super.key});

  final List<String> query = [
    '빵',
    '계란',
    '당근',
    '사과',
    '다진 소고기',
    '닭고기',
    '치즈',
    '설탕',
    '새우',
  ];

  /*
  bool _visibility = true;

  void _show() {
    setState(() {
      _visibility = true;
    });
  }

  void _hide() {
    setState(() {
      _visibility = false;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'You Have',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 2.0,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 320,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white,
              width: 1.5,
            ),
            /*boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 0),
              )
            ],*/
          ),
          child: Row(
            children: [
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis, //말줄임표로 overflow 표시
                  maxLines: 4,
                  strutStyle: const StrutStyle(fontSize: 15),
                  text: TextSpan(
                    text: query.join(', '),
                    style: const TextStyle(
                      height: 1.6,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
