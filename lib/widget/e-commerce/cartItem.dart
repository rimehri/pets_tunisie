import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe/data/model/ecommerceProduct.dart';

import '../../comonents/constants.dart';

class cartItem extends StatelessWidget {
  final Product cart;
  const cartItem({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 8.0,top: 8),
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)

      ),
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppConsts.appDeepOrange,
                    borderRadius: BorderRadius.circular(20)

                ),
                child: Text("-"+cart.pOffer.toString()+"%",style: TextStyle(fontSize: 14,color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              Icon(Icons.favorite_border,color: Colors.red,)

            ],
          ),
          InkWell(

            onTap: (){},
            child: Container(

              margin: EdgeInsets.all(10),
              child: Image.asset("assets/kity.png"),
            ),
          ),
          Container(

            padding: EdgeInsets.only(bottom:8 ),
            alignment: Alignment.centerLeft,
            child: Text(cart.pName!,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color:AppConsts.appDeepOrange
            ),),

          ),
          Container(
            child: Text(cart.pDescription!+"description",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45
              ),


            ),

          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("dt"+cart.pPrice.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold
                    ,color: Colors.black87),),
                Icon( Icons.shopping_cart_checkout,color: AppConsts.appDeepOrange,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
