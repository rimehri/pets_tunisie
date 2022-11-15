

import 'package:flutter/material.dart';
import 'package:pfe/widget/splash_content.dart';
import 'package:pfe/widget/user/login_page.dart';

import '../comonents/default_button.dart';
import '../config/constants.dart';
import '../config/size_config.dart';








class home extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<home> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Bienvenue chez Pets Tunisie",
      "image": "assets/front.png"

    },
    {
      "text":
      "Nous aidons les gens à gérer leurs animaux à distance",
      "image": "assets/kid.png"
    },
    {
      "text": "Nous montrons la manière simple \n  Restez à la maison avec nous",
      "image": "assets/dog.png"
    },
    {
      "text": "Protégez Vos animaux avec Un code QR",
      "image": "assets/scan-2.png"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]['text']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),

                    ),

                    Spacer(flex: 3),
                    DefaultButton(
                      text: "on commence",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20: 6,
      decoration: BoxDecoration(
        color: currentPage == index ?    Color.fromRGBO(59, 120, 121, 1) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
