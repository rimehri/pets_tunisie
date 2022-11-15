

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../comonents/constants.dart';
class ItemBottom extends StatelessWidget {
  const ItemBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container (
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0,3),

            ),

          ],


        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("120dt ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:AppConsts.appDeepOrange)),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(CupertinoIcons.cart_badge_plus), label: Text("Add To Cart",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              
              
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppConsts.appDeepOrange),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical:13,horizontal: 15 )),
                shape: MaterialStateProperty.all < RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
                )



              ),
            )
          ],
        ),
      ),
    );
  }
}
