import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pfe/data/model/ecommerceProduct.dart';

import '../../../comonents/constants.dart';
import 'bottomapp.dart';
import 'cartappbar.dart';

class DetailsProduct  extends StatelessWidget {
  final Product product;
  const DetailsProduct ({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedecf2),
    body: ListView(
      children: [
        CartAppBar(),
        Padding(padding: EdgeInsets.all(16),
        child: Image.asset("assets/kity.png",height: 300,),),
        Arc(
          edge:Edge.TOP,
          arcType: ArcType.CONVEX,
          height: 30,
          child: Container(
            width: double.infinity,
            color: Colors.white,

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [

                  Padding(padding: EdgeInsets.only(top: 50,bottom: 20),
                  child: Row(
                    children: [
                      Text(product.pName!, style: TextStyle(fontSize: 28,color: AppConsts.appDeepOrange,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5,bottom: 10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating:4,
                        minRating: 1,
                        itemCount: 5,
                        itemSize: 20,
                        direction: Axis.horizontal,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4,),
                        onRatingUpdate: ( index) {   },
                        itemBuilder: ( context,_) =>

                        Icon(Icons.favorite,color: AppConsts.appDeepOrange,)  ,

                        ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
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
                            padding: EdgeInsets.all(5),
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
                  ) ,
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(product.pDescription!+"this artcle is new herethis artcle is new herethis artcle is new herethis artcle is new herethis this artcle "
                        "is new herethis artcle is new herethis artcle is new herethis artcle is new herethis artcle is new hereartcle is new herethis artcle is new here ",textAlign:TextAlign.justify,style: TextStyle(
                      fontSize: 17,

                      color:Colors.black45
                    ),),

                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
      bottomNavigationBar: ItemBottom(),
    );
  }
}
