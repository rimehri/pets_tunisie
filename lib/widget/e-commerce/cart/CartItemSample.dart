

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../comonents/constants.dart';
import 'detailProduct.dart';

class CartItemSample extends StatelessWidget {
  const CartItemSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for ( int i=1 ; i <5; i++)
          InkWell(
            onTap: (){


            },
            child: Container(
              height: 110,
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Radio(value: "", groupValue: "", onChanged: (index){},
                    activeColor: AppConsts.appDeepOrange,


                  ),
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 15),
                    child: Image.asset("assets/kity.png"),


                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Product Title",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppConsts.appDeepOrange
                        ),),
                        Text("\$55",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                            color: AppConsts.appDeepOrange
                        ),)

                      ],
                    ),


                  ),
                  Spacer(),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.delete,color: Colors.red,),
                        Row(
                          children: [
                            Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10
                                ),

                              ]
                            ),
                            child: Icon(CupertinoIcons.minus,size: 18,),
                          ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "01",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppConsts.appDeepOrange
                              ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10
                                    ),

                                  ]
                              ),
                              child: Icon(CupertinoIcons.plus,size: 18,),
                            ),

                          ],
                        )
                      ],
                    ),

                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
