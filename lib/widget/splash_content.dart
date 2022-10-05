import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
     required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text("Pets Tunisie" , style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,color: Color.fromRGBO(59, 120, 121, 1), letterSpacing: .4)),),
        Text(
          text,
          textAlign: TextAlign.center,
            style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold, letterSpacing: .5))
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
