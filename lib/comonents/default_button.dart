import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/size_config.dart';



class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
         color: Color.fromRGBO(59, 120, 121, 1),

        onPressed: press,
        child:

        Text(text ,
          style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.bold,color: Colors.white, letterSpacing: .5)),),


        // Text(
        //   text,
        //   style: TextStyle(
        //     fontSize: getProportionateScreenWidth(18),
        //     color: Colors.white,
        //   ),
        //),
      ),
    );
  }
}