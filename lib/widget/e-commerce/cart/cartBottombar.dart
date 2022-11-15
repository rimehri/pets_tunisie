

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../comonents/constants.dart';

class cartBottomNavBar extends StatelessWidget {
  const cartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style: TextStyle(color:AppConsts.appDeepOrange,fontSize: 22,fontWeight: FontWeight.bold),),
                Text("\$250",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),)
              ],

            ),
            Container(
              alignment: Alignment.center,
              child: Text("Check out ", style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)),
              height: 50,
              decoration: BoxDecoration(color: AppConsts.appDeepOrange,
              borderRadius: BorderRadius.circular(20),


              ),
            )
          ],
        ),
    )
    );
  }
}
