import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/size_config.dart';



class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      { "text": "hotel pets",},
      { "text": "pets sitter"},
      { "text": "dressage"},
      { "text": "More",},



    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(


            text: categories[index]["text"],
            press: () {

            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,

    required this.text,
    required this.press,
  }) : super(key: key);

  final String?  text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(

       // padding: EdgeInsets.all(10),
        height: getProportionateScreenWidth(35),
         width: getProportionateScreenWidth(80),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Color.fromRGBO(59, 120, 121, 1),),

          borderRadius: BorderRadius.circular(20),
        ),
        child:Center(child: Text(text!,style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(color: Color.fromRGBO(59, 120, 121, 1),fontSize: 15)),))
      ),
    );
  }
}
