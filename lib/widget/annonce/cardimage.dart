

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/size_config.dart';



class card extends StatelessWidget {
  const card({
    Key? key,

     required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      SizedBox(height: 20,),

        Container(
             height: 200,
            // width: getProportionateScreenWidth(350),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),

            image: DecorationImage(image: NetworkImage(image),fit:BoxFit.cover, )
          ),
          // child: Image.network(
          //
          //   image,
          //   height: getProportionateScreenHeight(200),
          //   width: getProportionateScreenWidth(235),
          // ),
        ),
      ],
    );
  }
}
