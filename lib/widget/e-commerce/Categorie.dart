


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../comonents/constants.dart';

class CategorieWidget extends StatelessWidget {
  const CategorieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 1 ; i < 5 ; i++ )
          Container (
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),


            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // use i variable to change pictures in loop
                SvgPicture.asset("assets/c$i.svg",
                  width: 40,height: 40,),
                Text("Food",style: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold,
                  color: AppConsts.appDeepOrange
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
