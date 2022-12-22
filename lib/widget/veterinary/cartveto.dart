

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/data/model/User.dart';

class cartveto extends StatefulWidget {
  final User cart;

  const cartveto({Key? key,required this.cart }) : super(key: key);

  @override
  State<cartveto> createState() => _cartvetoState();
}

class _cartvetoState extends State<cartveto> {

  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.only(left: 10,right: 10,),
        padding: EdgeInsets.only(left: 8,top: 8,bottom: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(4.0, 4.0), // shadow direction: bottom right
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(

                  children: [
                    Container (
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        //borderRadius: ,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/doctor.jpg')
                          )
                      ),
                    ),



                    Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 80.0),
                          child: Text(
                          "Dr. " + widget.cart.name! ,
                            style:GoogleFonts.gloriaHallelujah(textStyle:  TextStyle(fontSize: 20,
                                color: Colors.black,fontWeight: FontWeight.bold)
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Row(

                              children: [


                                IconButton(
                                  icon:
                                  SvgPicture.asset("assets/location.svg",
                                    width: 20.0,
                                    color:Colors.red,
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  "Tunis",
                                  style:GoogleFonts.gloriaHallelujah (textStyle:TextStyle(
                                    color: Colors.black,
                                  ),

                                  ),),
                              ],
                            ),
                            Row(

                              children: [


                                IconButton(
                                  icon:
                                  SvgPicture.asset("assets/phone.svg",
                                    width: 17.0,
                                    color:Colors.red,
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  widget.cart.phone!,
                                  style:GoogleFonts.gloriaHallelujah (textStyle:TextStyle(
                                    color: Colors.black,
                                  ),

                                  ),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),



                  ],
                ),


              ],
            ),

            Container(


              margin: EdgeInsets.only(left: 200,top: 80),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,

                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ],
        ));
  }
}
